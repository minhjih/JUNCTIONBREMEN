////
////  cameraView.swift
////  2024
////
////  Created by 임유리 on 8/10/24.
////
//
////import SwiftUI
////import AVFoundation
////import Combine
////
////struct cameraView: View {
////    @ObservedObject var viewModel = CameraViewModel()
////
////    var body: some View {
////        ZStack {
////            
////            viewModel.cameraPreview.ignoresSafeArea()
////                .onAppear {
////                    viewModel.configure()
////                }
////            
////            VStack {
////                HStack {
////                    // 셔터사운드 온오프
////                    Button(action: {viewModel.switchFlash()}) {
////                        Image(systemName: viewModel.isFlashOn ?
////                              "speaker.fill" : "speaker")
////                            .foregroundColor(viewModel.isFlashOn ? .yellow : .white)
////                    }
////                    .padding(.horizontal, 30)
////                    
////                    // 플래시 온오프
////                    Button(action: {viewModel.switchSilent()}) {
////                        Image(systemName: viewModel.isSilentModeOn ?
////                              "bolt.fill" : "bolt")
////                            .foregroundColor(viewModel.isSilentModeOn ? .yellow : .white)
////                    }
////                    .padding(.horizontal, 30)
////                }
////                .font(.system(size:25))
////                .padding()
////                
////                Spacer()
////                
////                HStack{
////                    // 찍은 사진 미리보기, 일단 액션 X
////                    Button(action: {}) {
////                        if let previewImage = viewModel.recentImage {
////                            Image(uiImage: previewImage)
////                                .resizable()
////                                .scaledToFill()
////                                .frame(width: 75, height: 75)
////                                .clipShape(RoundedRectangle(cornerRadius: 15))
////                                .aspectRatio(1, contentMode: .fit)
////                        } else {
////                            // ✅ linewidth 살짝 수정
////                            RoundedRectangle(cornerRadius: 15)
////                                .stroke(lineWidth: 3)
////                                .foregroundColor(.white)
////                                .frame(width: 75, height: 75)
////                        }
////                    }
////                    .padding()
////                    
////                    Spacer()
////                    
////                    // 사진찍기 버튼
////                    Button(action: {viewModel.capturePhoto()}) {
////                        Circle()
////                            .stroke(lineWidth: 5)
////                            .frame(width: 75, height: 75)
////                            .padding()
////                    }
////                    
////                    Spacer()
////                    
////                    // 전후면 카메라 교체
////                    Button(action: {viewModel.changeCamera()}) {
////                        Image(systemName: "arrow.triangle.2.circlepath.camera")
////                            .resizable()
////                            .scaledToFit()
////                            .frame(width: 50, height: 50)
////                        
////                    }
////                    .frame(width: 75, height: 75)
////                    .padding()
////                }
////            }
////            .foregroundColor(.white)
////        }
////    }
////}
////
////class CameraViewModel: ObservableObject {
////    private let model: Camera
////    private let session: AVCaptureSession
////    let cameraPreview: AnyView
////    
////    private var subscriptions = Set<AnyCancellable>()
////    
////    @Published var recentImage: UIImage?
////    @Published var isFlashOn = false
////    @Published var isSilentModeOn = false
////    
////    func configure() {
////        model.requestAndCheckPermissions()
////    }
////    
////    func switchFlash() {
////        isFlashOn.toggle()
////    }
////    
////    func switchSilent() {
////        isSilentModeOn.toggle()
////    }
////    
////    func capturePhoto() {
////        model.capturePhoto()
////        print("[CameraViewModel]: Photo captured!")
////    }
////    
////    
////    func changeCamera() {
////        print("[CameraViewModel]: Camera changed!")
////    }
////    
////    init() {
////        model = Camera()
////        session = model.session
////        cameraPreview = AnyView(CameraPreviewView(session: session))
////        
////        model.$recentImage.sink { [weak self] (photo) in
////            guard let pic = photo else { return }
////            self?.recentImage = pic
////        }
////        .store(in: &self.subscriptions)
////        
////    }
////}
////
////class Camera: NSObject, ObservableObject {
////    var session = AVCaptureSession()
////    var videoDeviceInput: AVCaptureDeviceInput!
////    let output = AVCapturePhotoOutput()
////    
////    var photoData = Data(count: 0)
////    @Published var recentImage: UIImage?
////    // 카메라 셋업 과정을 담당하는 함수, positio
////    func setUpCamera() {
////        if let device = AVCaptureDevice.default(.builtInWideAngleCamera,
////                                                for: .video, position: .back) {
////            do { // 카메라가 사용 가능하면 세션에 input과 output을 연결
////                videoDeviceInput = try AVCaptureDeviceInput(device: device)
////                if session.canAddInput(videoDeviceInput) {
////                    session.addInput(videoDeviceInput)
////                }
////                
////                if session.canAddOutput(output) {
////                    session.addOutput(output)
////                    output.isHighResolutionCaptureEnabled = true
////                    output.maxPhotoQualityPrioritization = .quality
////                }
////                session.startRunning() // 세션 시작
////            } catch {
////                print(error) // 에러 프린트
////            }
////        }
////    }
////    
////    func requestAndCheckPermissions() {
////        // 카메라 권한 상태 확인
////        switch AVCaptureDevice.authorizationStatus(for: .video) {
////        case .notDetermined:
////            // 권한 요청
////            AVCaptureDevice.requestAccess(for: .video) { [weak self] authStatus in
////                if authStatus {
////                    DispatchQueue.main.async {
////                        self?.setUpCamera()
////                    }
////                }
////            }
////        case .restricted:
////            break
////        case .authorized:
////            // 이미 권한 받은 경우 셋업
////            setUpCamera()
////        default:
////            // 거절했을 경우
////            print("Permession declined")
////        }
////    }
//// 
////       func capturePhoto() {
////           // 사진 옵션 세팅
////           let photoSettings = AVCapturePhotoSettings()
////           
////           self.output.capturePhoto(with: photoSettings, delegate: self)
////           print("[Camera]: Photo's taken")
////       }
////       
////  
////       func savePhoto(_ imageData: Data) {
////           guard let image = UIImage(data: imageData) else { return }
////           UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
////           
////           // 사진 저장하기
////           print("[Camera]: Photo's saved")
////       }
////}
////
////
////extension Camera: AVCapturePhotoCaptureDelegate {
////    func photoOutput(_ output: AVCapturePhotoOutput, willBeginCaptureFor resolvedSettings: AVCaptureResolvedPhotoSettings) {
////    }
////    
////    func photoOutput(_ output: AVCapturePhotoOutput, willCapturePhotoFor resolvedSettings: AVCaptureResolvedPhotoSettings) {
////    }
////    
////    func photoOutput(_ output: AVCapturePhotoOutput, didCapturePhotoFor resolvedSettings: AVCaptureResolvedPhotoSettings) {
////    }
////    
////    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
////        guard let imageData = photo.fileDataRepresentation() else { return }
////        self.recentImage = UIImage(data: imageData)
////        self.savePhoto(imageData)
////        
////        print("[CameraModel]: Capture routine's done")
////    }
////}
////
////struct CameraPreviewView: UIViewRepresentable {
////    class VideoPreviewView: UIView {
////        override class var layerClass: AnyClass {
////             AVCaptureVideoPreviewLayer.self
////        }
////        
////        var videoPreviewLayer: AVCaptureVideoPreviewLayer {
////            return layer as! AVCaptureVideoPreviewLayer
////        }
////    }
////    
////    let session: AVCaptureSession
////   
////    func makeUIView(context: Context) -> VideoPreviewView {
////        let view = VideoPreviewView()
////        
////        view.videoPreviewLayer.session = session
////        view.backgroundColor = .black
////        view.videoPreviewLayer.videoGravity = .resizeAspectFill
////        view.videoPreviewLayer.cornerRadius = 0
////        view.videoPreviewLayer.connection?.videoOrientation = .portrait
////
////        return view
////    }
////    
////    func updateUIView(_ uiView: VideoPreviewView, context: Context) {
////        
////    }
////}
////
////struct CameraView_Previews: PreviewProvider {
////    static var previews: some View {
////        cameraView()
////    }
////}
////
//
//import SwiftUI
//import AVFoundation
//
//struct CameraView: View {
//    @ObservedObject var viewModel = CameraViewModel()
//    
//    var body: some View {
//        ZStack {
//            viewModel.cameraPreview.ignoresSafeArea()
//                .onAppear {
//                    viewModel.configure()
//                }
//                .gesture(MagnificationGesture()
//                            .onChanged { val in
//                    viewModel.zoom(factor: val)
//                }
//                            .onEnded { _ in
//                    viewModel.zoomInitialize()
//                }
//                )
//            
//            VStack {
//                HStack {
//                    // 셔터사운드 온오프
//                    Button(action: {viewModel.switchSilent()}) {
//                        Image(systemName: viewModel.isSilentModeOn ?
//                              "speaker.fill" : "speaker")
//                            .foregroundColor(viewModel.isSilentModeOn ? .yellow : .white)
//                    }
//                    .padding(.horizontal, 30)
//                    
//                    // 플래시 온오프
//                    Button(action: {viewModel.switchFlash()}) {
//                        Image(systemName: viewModel.isFlashOn ?
//                              "bolt.fill" : "bolt")
//                            .foregroundColor(viewModel.isFlashOn ? .yellow : .white)
//                    }
//                    .padding(.horizontal, 30)
//                }
//                .font(.system(size:25))
//                .padding()
//                
//                Spacer()
//                
//                HStack{
//                    // 찍은 사진 미리보기
//                    Button(action: {}) {
//                        if let previewImage = viewModel.recentImage {
//                            Image(uiImage: previewImage)
//                                .resizable()
//                                .scaledToFill()
//                                .frame(width: 75, height: 75)
//                                .clipShape(RoundedRectangle(cornerRadius: 15))
//                                .aspectRatio(1, contentMode: .fit)
//                        } else {
//                            RoundedRectangle(cornerRadius: 15)
//                                .stroke(lineWidth: 3)
//                                .foregroundColor(.white)
//                                .frame(width: 75, height: 75)
//                        }
//                    }
//                    .padding()
//                    
//                    Spacer()
//                    
//                    // 사진찍기 버튼
//                    Button(action: {viewModel.capturePhoto()}) {
//                        Circle()
//                            .stroke(lineWidth: 5)
//                            .frame(width: 75, height: 75)
//                            .padding()
//                    }
//                    
//                    Spacer()
//                    
//                    // 전후면 카메라 교체
//                    Button(action: {viewModel.changeCamera()}) {
//                        Image(systemName: "arrow.triangle.2.circlepath.camera")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 50, height: 50)
//                        
//                    }
//                    .frame(width: 75, height: 75)
//                    .padding()
//                }
//            }
//            .foregroundColor(.white)
//        }
//        .opacity(viewModel.shutterEffect ? 0 : 1)
//    }
//}
//
//
//struct CameraPreviewView: UIViewRepresentable {
//    class VideoPreviewView: UIView {
//        override class var layerClass: AnyClass {
//            AVCaptureVideoPreviewLayer.self
//        }
//        
//        var videoPreviewLayer: AVCaptureVideoPreviewLayer {
//            return layer as! AVCaptureVideoPreviewLayer
//        }
//    }
//    
//    let session: AVCaptureSession
//    
//    func makeUIView(context: Context) -> VideoPreviewView {
//        let view = VideoPreviewView()
//        
//        view.videoPreviewLayer.session = session
//        view.backgroundColor = .black
//        view.videoPreviewLayer.videoGravity = .resizeAspectFill
//        view.videoPreviewLayer.cornerRadius = 0
//        view.videoPreviewLayer.connection?.videoOrientation = .portrait
//        
//        return view
//    }
//    
//    func updateUIView(_ uiView: VideoPreviewView, context: Context) {
//        
//    }
//}
//
//struct CameraView_Previews: PreviewProvider {
//    static var previews: some View {
//        CameraView()
//    }
//}
