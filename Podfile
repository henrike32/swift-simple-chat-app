# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
platform :ios, '16.4'

target 'SimpleChat' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for SimpleChat

	post_install do |installer|
		installer.pods_project.targets.each do |target|
			target.build_configurations.each do |config|
				config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
			end
		end
	end

pod 'Firebase/Analytics'
pod 'Firebase/Auth'
pod 'Firebase/Firestore'
pod 'nanopb', :inhibit_warnings => true

  target 'SimpleChatTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'SimpleChatUITests' do
    # Pods for testing
  end

end
