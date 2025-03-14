import SwiftUI
import SpriteKit

class GameScene: SKScene {
    private var ball: SKShapeNode?
    private var maze: SKShapeNode?
    
    override func didMove(to view: SKView) {
        physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)
        
        let border = SKPhysicsBody(edgeLoopFrom: frame)
        border.friction = 0
        border.restitution = 0.5
        self.physicsBody = border
        
        createMaze()
        createBall()
    }
    
    func createMaze() {
        let mazePath = CGMutablePath()
        mazePath.move(to: CGPoint(x: 50, y: 50))
        mazePath.addLine(to: CGPoint(x: 300, y: 50))
        mazePath.addLine(to: CGPoint(x: 300, y: 300))
        mazePath.addLine(to: CGPoint(x: 50, y: 300))
        mazePath.addLine(to: CGPoint(x: 50, y: 50))
        
        maze = SKShapeNode(path: mazePath)
        maze?.strokeColor = .black
        maze?.lineWidth = 2
        maze?.physicsBody = SKPhysicsBody(edgeLoopFrom: mazePath)
        maze?.physicsBody?.isDynamic = false
        maze?.physicsBody?.friction = 0.2
        maze?.physicsBody?.restitution = 0.2
        
        addChild(maze!)
    }
    
    func createBall() {
        ball = SKShapeNode(circleOfRadius: 10)
        ball?.position = CGPoint(x: frame.midX, y: frame.midY)
        ball?.fillColor = .blue
        ball?.physicsBody = SKPhysicsBody(circleOfRadius: 10)
        ball?.physicsBody?.isDynamic = true
        ball?.physicsBody?.mass = 0.1
        ball?.physicsBody?.friction = 0.2
        ball?.physicsBody?.restitution = 0.5
        ball?.physicsBody?.allowsRotation = true
        
        addChild(ball!)
        
    }
    
    func updateGravity(rotation: Double) {
        let angle = rotation * Double.pi / 180
        let gravityX = 9.8 * sin(angle)
        let gravityY = -9.8 * cos(angle)
        
        physicsWorld.gravity = CGVector(dx: gravityX, dy: gravityY)
    }
}

struct ContentView: View {
    @State private var rotation: Double = 0
    private let gameScene = GameScene()
    var scene: SKScene {
        
        gameScene.size = CGSize(width: 350, height: 350)
        gameScene.scaleMode = .fill
        gameScene.backgroundColor = .white
        return gameScene
    }
    var body: some View {
        VStack {
            SpriteView(scene: scene)
                .frame(width: 350, height: 350)
                .rotationEffect(.degrees(rotation))
            Spacer()
            Slider(value: $rotation, in: 0 ... 360, step: 0.1)
                .onChange(of: rotation) { newValue in
                    gameScene.updateGravity(rotation: newValue)
                }
            Spacer()
        }
    }
    
}
#Preview {
    ContentView()
}
