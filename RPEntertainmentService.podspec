
Pod::Spec.new do |spec|

  spec.name         = "RPEntertainmentService"
  spec.version      = "0.0.1"
  spec.summary      = "Dependencia encargada de contener la definicion de los servicios Rappi Entretainment"

  spec.description  = <<-DESC
  Dependencia que contienen los servicios que expone a los desarrolladores que quieran consumir 
  los servicios de Peliculas y Tv de Rappi Entretainment
                   DESC

  spec.homepage     = "https://github.com/javierbc121086/RPEntertainmentService"
  spec.license      = "MIT (example)"
  spec.license      = { :type => "MIT", :file => "LICENSE" }


  spec.author             = { "Javier Bolaños Carapia" => "javier.bc121086@gmail.com" }
  spec.social_media_url   = "https://www.linkedin.com/in/javier-bola%C3%B1os-carapia-47b079152/"


  spec.platform     = :ios
  spec.ios.deployment_target = "9.0"


  spec.source       = { :git => "git@github.com:javierbc121086/RPEntertainmentService.git", :tag => "#{spec.version}" }


  spec.source_files  = "RPEntertainmentService", "RPEntertainmentService/**/*.{h,m,swift}"
  spec.exclude_files = "Classes/Exclude"


  spec.requires_arc = true
  spec.swift_versions = "5.0.1"

  spec.dependency "GNNetworkServices"
  spec.dependency "GNSwissRazor"
  spec.dependency "RPEntertainmentDomain"

end

## Release New Pod ##
# pod repo push RPEntertainmentServiceSpec RPEntertainmentService.podspec --allow-warnings --sources='https://github.com/CocoaPods/Specs.git,https://gitlab.com/GonetGrupo/iOS/Dependencies/Spects/GNNetworkServicesSpec.git,https://gitlab.com/GonetGrupo/iOS/Dependencies/Spects/GNSwissRazorSpec.git,git@github.com:javierbc121086/RPEntertainmentDomainSpec.git' --private --verbose