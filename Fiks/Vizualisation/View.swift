//
//  View.swift
//  Fiks
//
//  Created by vojta on 19.01.2022.
//

import Cocoa

class View: NSView {
    
    var array = Array<Array<Int>>()
    var object: Object?

    let radius:CGFloat = 90
    
    var currentAngle:Float = 0
    
    var conections: [((Int,Int),(Int,Int))] = []
    
    var highlight: Int? = nil
    var current: Int!
    var prev: (Int,Int)?
    var curr: (Int, Int)?
    var prevNum: Int!
    var completedSet: Set<Int> = []

    var visited: Set<Int> = []
    
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let self = self else { return }
            sleep(5)
            let data = """
            2
            6 6 0
            0 1
            1 2
            1 3
            3 2
            2 4
            2 5
            2 2 0
            0 1
            1 0
            """
            let obj = devideInput(data)[0]
            
            self.array = Helpers.create2Darray(Double(obj.P))
            self.object = obj
            self.current = obj.n
            self.prevNum = obj.n
            self.highlight = obj.n
            self.process(object: obj)
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        // Drawing code here.
        
        
        
        
        let x = bounds.width / CGFloat(array.count)
        var k = 0
        for i in 0..<array.count {
            for j in 0..<array[0].count {
                let element = array[i][j]
                if element == -1 { continue }
                guard let context = NSGraphicsContext.current?.cgContext else { return }
                context.setFillColor(NSColor.blue.cgColor)
                if k == highlight {
                    context.setFillColor(NSColor.green.cgColor)
                }
                
                if k == current {
                    curr = (i,j)
                }
                
                if k == prevNum {
                    prev = (i,j)
                }
                context.fillEllipse(in: CGRect(x: x * CGFloat(i) + x / 2 - radius,
                                               y: x * CGFloat(j) + x / 2 - radius,
                                               width: radius,
                                               height: radius))
                
                k += 1
            }
        }
        
        for conection in conections {
            let pre = conection.0
            let cur = conection.1
            let i = pre.0
            let j = pre.1
//            path.move(to: CGPoint(x: x * CGFloat(i) + x / 2, y:  x * CGFloat(j) + x / 2))
//            print("adding path to", (prev,curr))
            let k = cur.0
            let l = cur.1
//            path.addLine(to: CGPoint(x: x * CGFloat(k) + x / 2, y:  x * CGFloat(l) + x / 2))
//            context.addPath(path)
//            context.setStrokeColor(NSColor.black.cgColor)
            let figure = NSBezierPath()
                figure.move(to: CGPoint(x: x * CGFloat(i) + x / 2 - radius / 2,
                                        y:  x * CGFloat(j) + x / 2 - radius / 2)) // {x,y} start point
                figure.line(to: CGPoint(x: x * CGFloat(k) + x / 2 - radius / 2,
                                        y:  x * CGFloat(l) + x / 2 - radius / 2)) //  {x,y} destination
                figure.lineWidth = 1  // hair line
                figure.stroke()
        }
        
        if let prev = prev, let curr = curr {
            conections.append((prev,curr))
//            let path = CGMutablePath()
            let i = prev.0
            let j = prev.1
//            path.move(to: CGPoint(x: x * CGFloat(i) + x / 2, y:  x * CGFloat(j) + x / 2))
//            print("adding path to", (prev,curr))
            let k = curr.0
            let l = curr.1
//            path.addLine(to: CGPoint(x: x * CGFloat(k) + x / 2, y:  x * CGFloat(l) + x / 2))
//            context.addPath(path)
//            context.setStrokeColor(NSColor.black.cgColor)
            let figure = NSBezierPath()
                figure.move(to: CGPoint(x: x * CGFloat(i) + x / 2 - radius / 2,
                                        y:  x * CGFloat(j) + x / 2 - radius / 2)) // {x,y} start point
                figure.line(to: CGPoint(x: x * CGFloat(k) + x / 2 - radius / 2,
                                        y:  x * CGFloat(l) + x / 2 - radius / 2)) //  {x,y} destination
                figure.lineWidth = 1  // hair line
                figure.stroke()
        }
        
        
        
        
        
        
        
    }
    
    
    
    
    
    func process(object: Object) {
        let completed: LinkedList<Int> = LinkedList()
        let graph = object.relations
        //  Needs fix but after the fix it might work as expected....
        if findACircle(object: object) {
            print("circle")
            return
        }
        current = object.n
        highlight = object.n
        DispatchQueue.main.async {
            self.setNeedsDisplay(self.frame)
        }
        sleep(1)
        search(object.n, object.n)
        
        func search(_ n: Int,_ from: Int) {
            
            highlight = n
            DispatchQueue.main.async {
                self.setNeedsDisplay(self.frame)
            }
            visited.insert(n)
            if let arr = graph[n] {
                for i in arr {
                    highlight = i
                    DispatchQueue.main.async {
                        self.setNeedsDisplay(self.frame)
                    }
                    sleep(1)

                    search(i,n)
                    sleep(1)

                    DispatchQueue.main.async {
                        self.setNeedsDisplay(self.frame)
                    }
                }
            }
            //not sure if it works probably breaks the whole algorithm but on the input that i tested it worked X)
            if completedSet.contains(n) {
                completed.removeAll()
                completedSet = []
                conections = []
            }
            current = n
            prevNum = from
            completed.append(n)
            completedSet.insert(n)
        }
        sleep(5)
        visited = []
        conections = []
        process(object: object)
    }
    
    
    
    
    
    
    
    
}
