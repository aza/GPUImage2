//
//  ViewController.swift
//  GPUImageJSON
//
//  Created by Aza Raskin on 11/5/16.
//  Copyright © 2016 Elsewhere. All rights reserved.
//

import UIKit
import GPUImage
import AVFoundation

class ViewController: UIViewController {
    
    var renderView: RenderView!
    var camera: Camera!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenSize: CGRect = UIScreen.main.bounds
        renderView = RenderView.init(frame: screenSize)
        
        self.view.addSubview(renderView)
        
        do {
            camera = try Camera(sessionPreset: AVCaptureSessionPreset1280x720)
            
            let eraser = "[{\"id\":\"camera\",\"outputs\":[\"f6c9557d-2363-4600-9fc2-c46c8e6a37a7\"]},{\"filter\":\"Posterize\",\"id\":\"f6c9557d-2363-4600-9fc2-c46c8e6a37a7\",\"inputs\":[\"camera\"],\"options\":{\"colorLevels\":1.53},\"outputs\":[\"87e93265-1068-4372-8357-249696dd6063\"]},{\"filter\":\"PrewittEdgeDetection\",\"id\":\"87e93265-1068-4372-8357-249696dd6063\",\"inputs\":[\"f6c9557d-2363-4600-9fc2-c46c8e6a37a7\"],\"options\":{\"edgeStrength\":3.44},\"outputs\":[\"left-eye\",\"right-eye\"]},{\"filter\":\"LeftEye\",\"id\":\"left-eye\",\"inputs\":[\"87e93265-1068-4372-8357-249696dd6063\"]},{\"filter\":\"RightEye\",\"id\":\"right-eye\",\"inputs\":[\"87e93265-1068-4372-8357-249696dd6063\"]}]"
            
            let sumie = "[{\"id\":\"camera\",\"outputs\":[\"dc85a745-f8fc-4a85-889d-874e20733675\",\"f2cf45e4-56a6-4fb9-a050-bb1bd3c86588\"]},{\"filter\":\"LeftEye\",\"id\":\"left-eye\",\"inputs\":[\"cf8eb3f6-ecb9-4b5f-8263-923b6d52cf59\"]},{\"filter\":\"RightEye\",\"id\":\"right-eye\",\"inputs\":[\"cf8eb3f6-ecb9-4b5f-8263-923b6d52cf59\"]},{\"filter\":\"BilateralBlur\",\"id\":\"f7342b0e-1a22-411c-b516-97a56713d830\",\"inputs\":[\"ecc96947-3c84-448a-8953-100674a4acb0\"],\"options\":{\"distanceNormalizationFactor\":8},\"outputs\":[\"928cf280-18ec-456c-a950-b36cc0418fa8\",\"5e1b9f51-4142-4447-bbc1-cf3d91e62638\"]},{\"filter\":\"BilateralBlur\",\"id\":\"ecc96947-3c84-448a-8953-100674a4acb0\",\"inputs\":[\"efa426fc-c6b5-4a36-ab83-77574de68da4\"],\"options\":{\"distanceNormalizationFactor\":8},\"outputs\":[\"f7342b0e-1a22-411c-b516-97a56713d830\"]},{\"filter\":\"PrewittEdgeDetection\",\"id\":\"928cf280-18ec-456c-a950-b36cc0418fa8\",\"inputs\":[\"f7342b0e-1a22-411c-b516-97a56713d830\"],\"options\":{\"edgeStrength\":1.1111},\"outputs\":[\"5e1b9f51-4142-4447-bbc1-cf3d91e62638\"]},{\"filter\":\"ExposureAdjustment\",\"id\":\"3dd0a38d-ee0b-43b2-bd81-6c3262a81fc0\",\"inputs\":[\"f72f89ed-684e-401a-b00e-4e580191fa71\"],\"options\":{\"exposure\":0.0268},\"outputs\":[\"cf8eb3f6-ecb9-4b5f-8263-923b6d52cf59\"]},{\"filter\":\"ExclusionBlend\",\"id\":\"5e1b9f51-4142-4447-bbc1-cf3d91e62638\",\"inputs\":[\"f7342b0e-1a22-411c-b516-97a56713d830\",\"928cf280-18ec-456c-a950-b36cc0418fa8\"],\"outputs\":[\"f72f89ed-684e-401a-b00e-4e580191fa71\"]},{\"filter\":\"HueAdjustment\",\"id\":\"cf8eb3f6-ecb9-4b5f-8263-923b6d52cf59\",\"inputs\":[\"3dd0a38d-ee0b-43b2-bd81-6c3262a81fc0\"],\"options\":{\"hue\":360},\"outputs\":[\"left-eye\",\"right-eye\"]},{\"filter\":\"BoxBlur\",\"id\":\"dc85a745-f8fc-4a85-889d-874e20733675\",\"inputs\":[\"camera\"],\"options\":{\"blurRadiusInPixels\":2.0313},\"outputs\":[\"efa426fc-c6b5-4a36-ab83-77574de68da4\"]},{\"filter\":\"PerlinNoise\",\"id\":\"f2cf45e4-56a6-4fb9-a050-bb1bd3c86588\",\"inputs\":[\"camera\"],\"options\":{\"scale\":199.4897},\"outputs\":[\"f72f89ed-684e-401a-b00e-4e580191fa71\"]},{\"filter\":\"DissolveBlend\",\"id\":\"f72f89ed-684e-401a-b00e-4e580191fa71\",\"inputs\":[\"5e1b9f51-4142-4447-bbc1-cf3d91e62638\",\"f2cf45e4-56a6-4fb9-a050-bb1bd3c86588\"],\"options\":{\"mix\":0.0385},\"outputs\":[\"3dd0a38d-ee0b-43b2-bd81-6c3262a81fc0\"]},{\"filter\":\"FalseColor\",\"id\":\"efa426fc-c6b5-4a36-ab83-77574de68da4\",\"inputs\":[\"dc85a745-f8fc-4a85-889d-874e20733675\"],\"options\":{\"firstColor\":[0.7229166666666667,0.7229166666666667,0.7229166666666667],\"secondColor\":[0.3145198169834813,0.311250946150519,0.3150735294117647]},\"outputs\":[\"ecc96947-3c84-448a-8953-100674a4acb0\"]}]"
            
            let borderlands = "[{\"id\":\"camera\",\"outputs\":[\"e6f6d6c2-05dc-4d3f-8bb5-102a0b38547e\",\"bdd69048-057f-4d37-b799-99dbef698d9c\"]},{\"filter\":\"PrewittEdgeDetection\",\"id\":\"e6f6d6c2-05dc-4d3f-8bb5-102a0b38547e\",\"inputs\":[\"camera\"],\"options\":{\"edgeStrength\":4},\"outputs\":[\"1e66de3b-3fab-4d0f-9e8d-d05a6a16cc21\"]},{\"filter\":\"GammaAdjustment\",\"id\":\"bdd69048-057f-4d37-b799-99dbef698d9c\",\"inputs\":[\"camera\"],\"options\":{\"gamma\":1.0375},\"outputs\":[\"8c6288c6-858c-499c-8b49-cb3bedfe4125\"]},{\"filter\":\"ColorInversion\",\"id\":\"1e66de3b-3fab-4d0f-9e8d-d05a6a16cc21\",\"inputs\":[\"e6f6d6c2-05dc-4d3f-8bb5-102a0b38547e\"],\"outputs\":[\"8c6288c6-858c-499c-8b49-cb3bedfe4125\"]},{\"filter\":\"SoftLightBlend\",\"id\":\"8c6288c6-858c-499c-8b49-cb3bedfe4125\",\"inputs\":[\"bdd69048-057f-4d37-b799-99dbef698d9c\",\"1e66de3b-3fab-4d0f-9e8d-d05a6a16cc21\"],\"outputs\":[\"left-eye\",\"8a73e7db-dfc8-4341-b0e6-15445a40d41a\"]},{\"filter\":\"LeftEye\",\"id\":\"left-eye\",\"inputs\":[\"8c6288c6-858c-499c-8b49-cb3bedfe4125\"]},{\"filter\":\"RightEye\",\"id\":\"right-eye\",\"inputs\":[\"8a73e7db-dfc8-4341-b0e6-15445a40d41a\"]},{\"filter\":\"Delay\",\"id\":\"8a73e7db-dfc8-4341-b0e6-15445a40d41a\",\"inputs\":[\"8c6288c6-858c-499c-8b49-cb3bedfe4125\"],\"options\":{\"framesToDelay\":2.9921},\"outputs\":[\"right-eye\"]}]"
            
            let skittle = "[{\"id\":\"camera\",\"outputs\":[\"77af6e66-c825-41b1-8cd8-b93cbcebe013\",\"4dce357e-0423-4d87-9db5-966589fe6809\",\"f4f7cb1b-c1db-484e-b052-f8fe9dfcd831\"]},{\"filter\":\"GammaAdjustment\",\"id\":\"77af6e66-c825-41b1-8cd8-b93cbcebe013\",\"inputs\":[\"camera\"],\"options\":{\"gamma\":0.26},\"outputs\":[\"77fd10c4-a8a7-455d-bc56-4c32db979eb3\"]},{\"filter\":\"PrewittEdgeDetection\",\"id\":\"77fd10c4-a8a7-455d-bc56-4c32db979eb3\",\"inputs\":[\"77af6e66-c825-41b1-8cd8-b93cbcebe013\"],\"options\":{\"edgeStrength\":1},\"outputs\":[\"1bfe6569-f6c4-416e-a1dc-99a4ca2f4f85\"]},{\"filter\":\"LowPassFilter\",\"id\":\"1bfe6569-f6c4-416e-a1dc-99a4ca2f4f85\",\"inputs\":[\"77fd10c4-a8a7-455d-bc56-4c32db979eb3\"],\"options\":{\"strength\":0.63},\"outputs\":[\"d7389dcc-2263-41ba-93a3-0a6f22b7389e\"]},{\"filter\":\"RGBAdjustment\",\"id\":\"d7389dcc-2263-41ba-93a3-0a6f22b7389e\",\"inputs\":[\"1bfe6569-f6c4-416e-a1dc-99a4ca2f4f85\"],\"options\":{\"blue\":1,\"green\":1,\"red\":2.82},\"outputs\":[\"ee4c2bfd-86a4-42ec-acec-44eb0cb12f1a\"]},{\"filter\":\"PrewittEdgeDetection\",\"id\":\"4dce357e-0423-4d87-9db5-966589fe6809\",\"inputs\":[\"camera\"],\"options\":{\"edgeStrength\":1},\"outputs\":[\"bce4595f-d2e0-44c5-883a-2c30f0320b29\"]},{\"filter\":\"LowPassFilter\",\"id\":\"bce4595f-d2e0-44c5-883a-2c30f0320b29\",\"inputs\":[\"4dce357e-0423-4d87-9db5-966589fe6809\"],\"options\":{\"strength\":0.3},\"outputs\":[\"48e14f24-78fe-414d-88d3-858e50df5bca\"]},{\"filter\":\"RGBAdjustment\",\"id\":\"48e14f24-78fe-414d-88d3-858e50df5bca\",\"inputs\":[\"bce4595f-d2e0-44c5-883a-2c30f0320b29\"],\"options\":{\"blue\":1,\"green\":2.48,\"red\":1},\"outputs\":[\"ee4c2bfd-86a4-42ec-acec-44eb0cb12f1a\"]},{\"filter\":\"LightenBlend\",\"id\":\"ee4c2bfd-86a4-42ec-acec-44eb0cb12f1a\",\"inputs\":[\"d7389dcc-2263-41ba-93a3-0a6f22b7389e\",\"48e14f24-78fe-414d-88d3-858e50df5bca\"],\"outputs\":[\"dbfa8ad8-9f46-4d23-8fc8-f7d3f87c08a8\"]},{\"filter\":\"GammaAdjustment\",\"id\":\"f4f7cb1b-c1db-484e-b052-f8fe9dfcd831\",\"inputs\":[\"camera\"],\"options\":{\"gamma\":2.19},\"outputs\":[\"69e8ab7b-3b55-42d8-b84d-b471364a92e6\"]},{\"filter\":\"PrewittEdgeDetection\",\"id\":\"69e8ab7b-3b55-42d8-b84d-b471364a92e6\",\"inputs\":[\"f4f7cb1b-c1db-484e-b052-f8fe9dfcd831\"],\"options\":{\"edgeStrength\":1},\"outputs\":[\"8366f004-9900-481f-9fd3-d3e873ce6286\"]},{\"filter\":\"LowPassFilter\",\"id\":\"8366f004-9900-481f-9fd3-d3e873ce6286\",\"inputs\":[\"69e8ab7b-3b55-42d8-b84d-b471364a92e6\"],\"options\":{\"strength\":0.55},\"outputs\":[\"2afd0226-7f6c-48e4-a26f-08b563451b75\"]},{\"filter\":\"RGBAdjustment\",\"id\":\"2afd0226-7f6c-48e4-a26f-08b563451b75\",\"inputs\":[\"8366f004-9900-481f-9fd3-d3e873ce6286\"],\"options\":{\"blue\":2.91,\"green\":1,\"red\":1},\"outputs\":[\"dbfa8ad8-9f46-4d23-8fc8-f7d3f87c08a8\"]},{\"filter\":\"LightenBlend\",\"id\":\"dbfa8ad8-9f46-4d23-8fc8-f7d3f87c08a8\",\"inputs\":[\"ee4c2bfd-86a4-42ec-acec-44eb0cb12f1a\",\"2afd0226-7f6c-48e4-a26f-08b563451b75\"],\"outputs\":[\"left-eye\",\"abf23614-52c6-4ac9-a73b-a82dbebae411\"]},{\"filter\":\"LeftEye\",\"id\":\"left-eye\",\"inputs\":[\"dbfa8ad8-9f46-4d23-8fc8-f7d3f87c08a8\"]},{\"filter\":\"RightEye\",\"id\":\"right-eye\",\"inputs\":[\"abf23614-52c6-4ac9-a73b-a82dbebae411\"]},{\"filter\":\"Delay\",\"id\":\"abf23614-52c6-4ac9-a73b-a82dbebae411\",\"inputs\":[\"dbfa8ad8-9f46-4d23-8fc8-f7d3f87c08a8\"],\"options\":{\"framesToDelay\":3.0512},\"outputs\":[\"right-eye\"]}]"
            
            let lucy = "[{\"id\":\"camera\",\"outputs\":[\"f34a6962-4e75-46f1-bd02-e5471253b6ce\",\"46d65801-f08a-4c73-b8ca-6e7d0edbcd88\"]},{\"filter\":\"LeftEye\",\"id\":\"left-eye\",\"inputs\":[\"14687d28-6a53-4dda-be4f-054338306f32\"]},{\"filter\":\"RightEye\",\"id\":\"right-eye\",\"inputs\":[\"908fdb32-75bf-4716-8601-08801453e034\"]},{\"filter\":\"BilateralBlur\",\"id\":\"f7342b0e-1a22-411c-b516-97a56713d830\",\"inputs\":[\"f34a6962-4e75-46f1-bd02-e5471253b6ce\"],\"options\":{\"distanceNormalizationFactor\":8,\"texelSpacingMultiplier\":4},\"outputs\":[\"6a592d31-2a3c-48ae-a605-4c380d03af2d\"]},{\"filter\":\"BilateralBlur\",\"id\":\"f34a6962-4e75-46f1-bd02-e5471253b6ce\",\"inputs\":[\"camera\"],\"options\":{\"distanceNormalizationFactor\":8,\"texelSpacingMultiplier\":4},\"outputs\":[\"f7342b0e-1a22-411c-b516-97a56713d830\"]},{\"filter\":\"DivideBlend\",\"id\":\"6a592d31-2a3c-48ae-a605-4c380d03af2d\",\"inputs\":[\"f7342b0e-1a22-411c-b516-97a56713d830\",\"46d65801-f08a-4c73-b8ca-6e7d0edbcd88\"],\"outputs\":[\"e19e5cde-f912-4676-9f32-30865a846c77\"]},{\"filter\":\"ColorInversion\",\"id\":\"7f06f49d-7a83-4dfb-8a7e-044c784e705f\",\"inputs\":[\"e19e5cde-f912-4676-9f32-30865a846c77\"],\"outputs\":[\"fcac2260-58c6-4636-ac7d-bf7bf7579800\"]},{\"filter\":\"ExposureAdjustment\",\"id\":\"e19e5cde-f912-4676-9f32-30865a846c77\",\"inputs\":[\"6a592d31-2a3c-48ae-a605-4c380d03af2d\"],\"options\":{\"exposure\":-0.0667},\"outputs\":[\"7f06f49d-7a83-4dfb-8a7e-044c784e705f\"]},{\"filter\":\"SaturationAdjustment\",\"id\":\"14687d28-6a53-4dda-be4f-054338306f32\",\"inputs\":[\"1bfbf5a1-be19-4999-8a31-47ffd0a985b5\"],\"options\":{\"saturation\":1.831},\"outputs\":[\"left-eye\",\"908fdb32-75bf-4716-8601-08801453e034\"]},{\"filter\":\"SaturationAdjustment\",\"id\":\"fcac2260-58c6-4636-ac7d-bf7bf7579800\",\"inputs\":[\"7f06f49d-7a83-4dfb-8a7e-044c784e705f\"],\"options\":{\"saturation\":1.8228},\"outputs\":[\"2eb5c5a1-f229-422f-b036-57f4ada0417d\"]},{\"filter\":\"LowPassFilter\",\"id\":\"1bfbf5a1-be19-4999-8a31-47ffd0a985b5\",\"inputs\":[\"63184475-3c04-4aa6-95e8-c2b30e810791\"],\"options\":{\"strength\":0.1034},\"outputs\":[\"14687d28-6a53-4dda-be4f-054338306f32\"]},{\"filter\":\"ZoomBlur\",\"id\":\"46d65801-f08a-4c73-b8ca-6e7d0edbcd88\",\"inputs\":[\"camera\"],\"options\":{\"blurSize\":0.4032},\"outputs\":[\"6a592d31-2a3c-48ae-a605-4c380d03af2d\"]},{\"filter\":\"LowPassFilter\",\"id\":\"63184475-3c04-4aa6-95e8-c2b30e810791\",\"inputs\":[\"2eb5c5a1-f229-422f-b036-57f4ada0417d\"],\"options\":{\"strength\":0.1034},\"outputs\":[\"1bfbf5a1-be19-4999-8a31-47ffd0a985b5\"]},{\"filter\":\"LowPassFilter\",\"id\":\"2eb5c5a1-f229-422f-b036-57f4ada0417d\",\"inputs\":[\"fcac2260-58c6-4636-ac7d-bf7bf7579800\"],\"options\":{\"strength\":0.1207},\"outputs\":[\"63184475-3c04-4aa6-95e8-c2b30e810791\"]},{\"filter\":\"Delay\",\"id\":\"908fdb32-75bf-4716-8601-08801453e034\",\"inputs\":[\"14687d28-6a53-4dda-be4f-054338306f32\"],\"options\":{\"framesToDelay\":4.2661},\"outputs\":[\"right-eye\"]}]"
            
            let oilspil = "[{\"id\":\"camera\",\"outputs\":[\"4e51a8c8-7f2f-4f33-9cf9-a5b8c208e9d1\",\"0c28b221-b2ad-4239-822e-0ff4750064f5\",\"1f40e68e-fe74-4b53-82eb-208b4261b248\",\"3266faf2-02c9-47d2-9ea5-03414ef859ee\"]},{\"filter\":\"GammaAdjustment\",\"id\":\"90066d6a-3310-4d85-814a-9e0d7ddc1e52\",\"inputs\":[\"3266faf2-02c9-47d2-9ea5-03414ef859ee\"],\"options\":{\"gamma\":0.9},\"outputs\":[\"e53556d4-adde-4b49-8ace-1c9b1d5c1a5d\"]},{\"filter\":\"HighPassFilter\",\"id\":\"e53556d4-adde-4b49-8ace-1c9b1d5c1a5d\",\"inputs\":[\"90066d6a-3310-4d85-814a-9e0d7ddc1e52\"],\"options\":{\"strength\":0.95},\"outputs\":[\"46625f5f-3421-4e40-adc2-200033ab8fdd\"]},{\"filter\":\"HighPassFilter\",\"id\":\"46625f5f-3421-4e40-adc2-200033ab8fdd\",\"inputs\":[\"e53556d4-adde-4b49-8ace-1c9b1d5c1a5d\"],\"options\":{\"strength\":0.94},\"outputs\":[\"ea538947-ee58-4748-92dc-92692ffee522\"]},{\"filter\":\"HighPassFilter\",\"id\":\"ea538947-ee58-4748-92dc-92692ffee522\",\"inputs\":[\"46625f5f-3421-4e40-adc2-200033ab8fdd\"],\"options\":{\"strength\":0.93},\"outputs\":[\"bf9aaae9-f5c6-49dd-9d87-59fb50366a26\"]},{\"filter\":\"HighPassFilter\",\"id\":\"bf9aaae9-f5c6-49dd-9d87-59fb50366a26\",\"inputs\":[\"ea538947-ee58-4748-92dc-92692ffee522\"],\"options\":{\"strength\":0.93},\"outputs\":[\"e684373a-a9f5-4abe-829f-bc310a62f909\"]},{\"filter\":\"GammaAdjustment\",\"id\":\"4e51a8c8-7f2f-4f33-9cf9-a5b8c208e9d1\",\"inputs\":[\"camera\"],\"options\":{\"gamma\":0.29},\"outputs\":[\"c597d10a-5868-4ce6-ba36-7b08b2d34cf1\"]},{\"filter\":\"PrewittEdgeDetection\",\"id\":\"c597d10a-5868-4ce6-ba36-7b08b2d34cf1\",\"inputs\":[\"4e51a8c8-7f2f-4f33-9cf9-a5b8c208e9d1\"],\"options\":{\"edgeStrength\":1},\"outputs\":[\"abe70516-f264-4fae-b082-e97aba521387\"]},{\"filter\":\"LowPassFilter\",\"id\":\"abe70516-f264-4fae-b082-e97aba521387\",\"inputs\":[\"c597d10a-5868-4ce6-ba36-7b08b2d34cf1\"],\"options\":{\"strength\":0.19},\"outputs\":[\"0b3f0800-2809-4b68-938a-86bf4b9234ff\"]},{\"filter\":\"RGBAdjustment\",\"id\":\"0b3f0800-2809-4b68-938a-86bf4b9234ff\",\"inputs\":[\"abe70516-f264-4fae-b082-e97aba521387\"],\"options\":{\"blue\":1,\"green\":0.24,\"red\":0.28},\"outputs\":[\"bb9ed8d2-df43-4a02-b6f5-2ca8ef1fc189\"]},{\"filter\":\"GammaAdjustment\",\"id\":\"0c28b221-b2ad-4239-822e-0ff4750064f5\",\"inputs\":[\"camera\"],\"options\":{\"gamma\":2.32},\"outputs\":[\"dd7de806-cd2e-4d0d-96a1-876a70e90801\"]},{\"filter\":\"PrewittEdgeDetection\",\"id\":\"dd7de806-cd2e-4d0d-96a1-876a70e90801\",\"inputs\":[\"0c28b221-b2ad-4239-822e-0ff4750064f5\"],\"options\":{\"edgeStrength\":1},\"outputs\":[\"9e3d30c2-f8fb-4f96-ba80-46e8a9e89a06\"]},{\"filter\":\"LowPassFilter\",\"id\":\"9e3d30c2-f8fb-4f96-ba80-46e8a9e89a06\",\"inputs\":[\"dd7de806-cd2e-4d0d-96a1-876a70e90801\"],\"options\":{\"strength\":0.19},\"outputs\":[\"2a5e5528-f083-4907-b9ef-9d592911eeee\"]},{\"filter\":\"RGBAdjustment\",\"id\":\"2a5e5528-f083-4907-b9ef-9d592911eeee\",\"inputs\":[\"9e3d30c2-f8fb-4f96-ba80-46e8a9e89a06\"],\"options\":{\"blue\":0.19,\"green\":0.36,\"red\":1.13},\"outputs\":[\"1cbccb8d-9d86-4cb0-8703-0924dab207e3\"]},{\"filter\":\"PrewittEdgeDetection\",\"id\":\"1f40e68e-fe74-4b53-82eb-208b4261b248\",\"inputs\":[\"camera\"],\"options\":{\"edgeStrength\":1},\"outputs\":[\"e9757926-09d9-4a99-bf52-534875d1eeab\"]},{\"filter\":\"LowPassFilter\",\"id\":\"e9757926-09d9-4a99-bf52-534875d1eeab\",\"inputs\":[\"1f40e68e-fe74-4b53-82eb-208b4261b248\"],\"options\":{\"strength\":0.2},\"outputs\":[\"b5a331ba-00a9-460d-a5fc-f9032f58d217\"]},{\"filter\":\"RGBAdjustment\",\"id\":\"b5a331ba-00a9-460d-a5fc-f9032f58d217\",\"inputs\":[\"e9757926-09d9-4a99-bf52-534875d1eeab\"],\"options\":{\"blue\":0.36,\"green\":1,\"red\":0.19},\"outputs\":[\"1cbccb8d-9d86-4cb0-8703-0924dab207e3\"]},{\"filter\":\"LightenBlend\",\"id\":\"1cbccb8d-9d86-4cb0-8703-0924dab207e3\",\"inputs\":[\"2a5e5528-f083-4907-b9ef-9d592911eeee\",\"b5a331ba-00a9-460d-a5fc-f9032f58d217\"],\"outputs\":[\"bb9ed8d2-df43-4a02-b6f5-2ca8ef1fc189\"]},{\"filter\":\"LightenBlend\",\"id\":\"bb9ed8d2-df43-4a02-b6f5-2ca8ef1fc189\",\"inputs\":[\"0b3f0800-2809-4b68-938a-86bf4b9234ff\",\"1cbccb8d-9d86-4cb0-8703-0924dab207e3\"],\"outputs\":[\"c3f7084d-bc88-413d-b052-df7fc55e5bd7\"]},{\"filter\":\"ExposureAdjustment\",\"id\":\"c3f7084d-bc88-413d-b052-df7fc55e5bd7\",\"inputs\":[\"bb9ed8d2-df43-4a02-b6f5-2ca8ef1fc189\"],\"options\":{\"exposure\":1.01},\"outputs\":[\"e684373a-a9f5-4abe-829f-bc310a62f909\"]},{\"filter\":\"OverlayBlend\",\"id\":\"e684373a-a9f5-4abe-829f-bc310a62f909\",\"inputs\":[\"bf9aaae9-f5c6-49dd-9d87-59fb50366a26\",\"c3f7084d-bc88-413d-b052-df7fc55e5bd7\"],\"outputs\":[\"f9b070e1-9a98-4968-895d-186fb221c2e8\"]},{\"filter\":\"GammaAdjustment\",\"id\":\"f9b070e1-9a98-4968-895d-186fb221c2e8\",\"inputs\":[\"e684373a-a9f5-4abe-829f-bc310a62f909\"],\"options\":{\"gamma\":0.52},\"outputs\":[\"e029411c-afb9-4632-82b1-d1ba9a186beb\"]},{\"filter\":\"ExposureAdjustment\",\"id\":\"e029411c-afb9-4632-82b1-d1ba9a186beb\",\"inputs\":[\"f9b070e1-9a98-4968-895d-186fb221c2e8\"],\"options\":{\"exposure\":0.67},\"outputs\":[\"b44e2135-75bc-4ed0-aa4c-ce2b85814665\"]},{\"filter\":\"SwirlDistortion\",\"id\":\"b44e2135-75bc-4ed0-aa4c-ce2b85814665\",\"inputs\":[\"e029411c-afb9-4632-82b1-d1ba9a186beb\"],\"options\":{\"angle\":0.03,\"radius\":0.5},\"outputs\":[\"left-eye\",\"right-eye\"]},{\"filter\":\"LeftEye\",\"id\":\"left-eye\",\"inputs\":[\"b44e2135-75bc-4ed0-aa4c-ce2b85814665\"]},{\"filter\":\"RightEye\",\"id\":\"right-eye\",\"inputs\":[\"b44e2135-75bc-4ed0-aa4c-ce2b85814665\"]},{\"filter\":\"BoxBlur\",\"id\":\"3266faf2-02c9-47d2-9ea5-03414ef859ee\",\"inputs\":[\"camera\"],\"options\":{\"blurRadiusInPixels\":10},\"outputs\":[\"90066d6a-3310-4d85-814a-9e0d7ddc1e52\"]}]"
            
            let test = "[{\"id\":\"camera\",\"outputs\":[\"447b1396-59e8-449b-afc2-8d6863ec58d7\",\"59f98393-2741-43da-9301-6325cce55bf5\"]},{\"filter\":\"LeftEye\",\"id\":\"left-eye\",\"inputs\":[\"ce553a1f-35c1-442f-aad3-40326714de0c\"]},{\"filter\":\"RightEye\",\"id\":\"right-eye\",\"inputs\":[\"ce553a1f-35c1-442f-aad3-40326714de0c\"]},{\"filter\":\"AverageLuminanceThreshold\",\"id\":\"447b1396-59e8-449b-afc2-8d6863ec58d7\",\"inputs\":[\"camera\"],\"options\":{\"thresholdMultiplier\":1},\"outputs\":[\"b26d53c3-3f31-49d9-b440-a251c217a0a7\",\"a6f843a2-c096-4ac6-814d-9237af6346e2\"]},{\"filter\":\"DifferenceBlend\",\"id\":\"b26d53c3-3f31-49d9-b440-a251c217a0a7\",\"inputs\":[\"447b1396-59e8-449b-afc2-8d6863ec58d7\",\"a6f843a2-c096-4ac6-814d-9237af6346e2\"],\"outputs\":[\"5dd73cf3-6731-444f-80bc-a6bb05b125f0\",\"80819963-6762-471b-8c7f-b33bf65e847e\"]},{\"filter\":\"Delay\",\"id\":\"5dd73cf3-6731-444f-80bc-a6bb05b125f0\",\"inputs\":[\"b26d53c3-3f31-49d9-b440-a251c217a0a7\"],\"options\":{\"framesToDelay\":5.0649},\"outputs\":[\"80819963-6762-471b-8c7f-b33bf65e847e\"]},{\"filter\":\"Delay\",\"id\":\"a6f843a2-c096-4ac6-814d-9237af6346e2\",\"inputs\":[\"447b1396-59e8-449b-afc2-8d6863ec58d7\"],\"options\":{\"framesToDelay\":1},\"outputs\":[\"b26d53c3-3f31-49d9-b440-a251c217a0a7\"]},{\"filter\":\"DifferenceBlend\",\"id\":\"80819963-6762-471b-8c7f-b33bf65e847e\",\"inputs\":[\"b26d53c3-3f31-49d9-b440-a251c217a0a7\",\"5dd73cf3-6731-444f-80bc-a6bb05b125f0\"],\"outputs\":[\"f7342b0e-1a22-411c-b516-97a56713d830\"]},{\"filter\":\"DifferenceBlend\",\"id\":\"f7342b0e-1a22-411c-b516-97a56713d830\",\"inputs\":[\"80819963-6762-471b-8c7f-b33bf65e847e\",\"59f98393-2741-43da-9301-6325cce55bf5\"],\"outputs\":[\"2df671e2-742a-4804-ac8a-044b0e0ccb80\",\"e564e3f6-2ba2-441e-9ee5-f440b59146f1\"]},{\"filter\":\"HueAdjustment\",\"id\":\"ce553a1f-35c1-442f-aad3-40326714de0c\",\"inputs\":[\"e564e3f6-2ba2-441e-9ee5-f440b59146f1\"],\"options\":{\"hue\":0.5},\"outputs\":[\"left-eye\",\"right-eye\"]},{\"filter\":\"Delay\",\"id\":\"2df671e2-742a-4804-ac8a-044b0e0ccb80\",\"inputs\":[\"f7342b0e-1a22-411c-b516-97a56713d830\"],\"options\":{\"framesToDelay\":8.2759},\"outputs\":[\"e564e3f6-2ba2-441e-9ee5-f440b59146f1\"]},{\"filter\":\"DifferenceBlend\",\"id\":\"e564e3f6-2ba2-441e-9ee5-f440b59146f1\",\"inputs\":[\"f7342b0e-1a22-411c-b516-97a56713d830\",\"2df671e2-742a-4804-ac8a-044b0e0ccb80\"],\"outputs\":[\"ce553a1f-35c1-442f-aad3-40326714de0c\"]},{\"filter\":\"Delay\",\"id\":\"59f98393-2741-43da-9301-6325cce55bf5\",\"inputs\":[\"camera\"],\"options\":{\"framesToDelay\":3.3962},\"outputs\":[\"f7342b0e-1a22-411c-b516-97a56713d830\"]}]"
            
            let filter = OperationGroup.init(withJson: test)
            camera --> filter --> renderView
            camera.startCapture()
            
            
        } catch {
            fatalError("Failure starting camera.")
        }
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}



struct OperationNode {
    let id: String
    let className: String?
    
    let inputs: [String]?
    let outputs: [String]?
    let options: [String: Any]?
    
    let operation: ImageProcessingOperation?
}

struct OperationNodeList {
    let nodes: [OperationNode]
    
    var input: ImageProcessingOperation? {
        get {
            return self.nodes.first?.operation
        }
    }
    
    var output: ImageProcessingOperation? {
        get {
            return self.get(id:"left-eye")?.operation
        }
    }
}

extension OperationNode {
    init?(json: [String: Any]?) {
        
        guard let json = json,
              let id = json["id"] as? String else { return nil }
        
        self.id = id
        self.inputs = json["inputs"] as? [String]
        self.outputs = json["outputs"] as? [String]
        self.options = json["options"] as? [String: Any]
        self.className = json["filter"] as? String
        
        let operation = Operations().get(name: className)
        self.operation = operation == nil ? ImageRelay() : operation
        
        if operation == nil { print("  UNKNOWN FILTER:", className ) }
        
        self.options?.forEach{ uniformName, uniformValue in
            
            var operation: AnyObject?
            var didFindUniform = false
            
            switch self.operation {
            case is BasicOperation: operation = self.operation as? BasicOperation
            case is OperationGroup: operation = self.operation as? OperationGroup
            default: operation = nil
            }
            
            
            if operation != nil {
                if let uniformValue = uniformValue as? Float {
                    print( ">", uniformName, uniformValue )
                    let opMirror = Mirror.init(reflecting: operation!)
                    opMirror.children.forEach{ key, _ in
                        if key == uniformName {
                            print( " ", uniformName, "->", uniformValue )
                            operation?.setValue( uniformValue, forKey: uniformName )
                            didFindUniform = true
                        }
                    }
                    
                    if !didFindUniform { print( "  UNKNOWN UNIFORM:", uniformName, "FOR", className) }
                }
                
                let uniformValueArray = uniformValue as? [Any]
                
                if let basicOperation = operation as? BasicOperation,
                    let r = uniformValueArray?[0] as? Float,
                    let g = uniformValueArray?[1] as? Float,
                    let b = uniformValueArray?[2] as? Float {
                    basicOperation.uniformSettings[ uniformName ] = Color(red: r, green: g, blue: b)
                }
            }
        }
    }
}

extension OperationNodeList {
    
    init?(jsonArray: [Any]?) {
        guard let jsonArray = jsonArray  else { return nil }
        
        var operationNodeList = [OperationNode]()
        
        jsonArray.forEach{ entry in
            if let entry = entry as? [String: Any] {
                if let operationNode = OperationNode(json: entry) {
                    operationNodeList.append( operationNode )
                }
            }
        }

        self.nodes = operationNodeList
        
        operationNodeList.forEach { node in
            node.outputs?.forEach{ outputId in
                let outputNode = self.get(id: outputId)
                let source = node.operation
                
                if let target = outputNode?.operation {
                    source?.addTarget(target)
                }
            }
        }
    }
    
    func get(id: String) -> OperationNode? {
        return self.nodes.first{ node in
            return node.id == id
        }
    }
    
}

extension OperationGroup {
    
    convenience init(withJson jsonString: String) {
        
        let data = try? JSONSerialization.jsonObject(with: jsonString.data(using: .utf8)!, options: [])
        let operationNodeList = OperationNodeList(jsonArray: data as? [Any])
        
        self.init()
        
        self.configureGroup{ groupInput, groupOutput in
            if let listInput = operationNodeList?.input,
                let listOutput = operationNodeList?.output {
                
                groupInput.addTarget(listInput)
                listOutput.addTarget(groupOutput)
            }
        }
        
    }
    
}
