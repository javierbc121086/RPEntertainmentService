platform :ios, '9.0'

source 'https://github.com/CocoaPods/Specs.git' 
source 'https://gitlab.com/GonetGrupo/iOS/Dependencies/Spects/GNNetworkServicesSpec.git'
source 'https://gitlab.com/GonetGrupo/iOS/Dependencies/Spects/GNSwissRazorSpec.git'

target 'RPEntertainmentService' do
  
  use_frameworks!

  pod 'GNNetworkServices'
  pod 'GNSwissRazor'

  target 'RPEntertainmentServiceTests' do
    inherit! :search_paths
    
    pod 'GNNetworkServices'
    pod 'GNSwissRazor'
  end

end
