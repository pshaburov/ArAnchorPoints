import UIKit
import SceneKit
import ARKit

class OneModelUsingVectorsViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    private let nodeName = "banana"
    private let fileName = "banana-small"
    private let fileExtension = "dae"
    private let arViewModel = ARViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        sceneView.delegate = self
        sceneView.showsStatistics = true
        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        sceneView.session.pause()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let location = touches.first?.location(in: sceneView) else {
            return
        }

        if let nodeExists = sceneView.scene.rootNode.childNode(withName: nodeName, recursively: true) {
            nodeExists.removeFromParentNode()
        }
        addNoteToSceneUsingVector(location: location)
    }

    private func addNoteToSceneUsingVector(location: CGPoint) {
        guard let nodeModel = arViewModel.createSceneNodeForAsset(nodeName, assetPath: "art.scnassets/Banana/\(fileName).\(fileExtension)") else {
            return
        }
        if let hit = arViewModel.getHitResults(location: location, sceneView: sceneView, resultType: [.existingPlaneUsingExtent, .estimatedHorizontalPlane]) {
            let pointTranslation = hit.worldTransform.translation 
            nodeModel.position = SCNVector3(pointTranslation.x, pointTranslation.y, pointTranslation.z)
            sceneView.scene.rootNode.addChildNode(nodeModel)
        }
    }
}
