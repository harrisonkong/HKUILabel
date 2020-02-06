# HKUILabel
#### HK Enhanced HKUILabel

## Version History ##

1.0.0 - 2020/02/05 - Initial release

## MINIMUM REQUIREMENTS ##

Swift 4.0 or above

iOS 11.0 or above

## WHAT IS IT? ##

HKUILabel enhances the functionality of UILabel by providing these additional features:

### Dynamic Font Scaling ###

Allows you to dynamically calculate the font size base on one of the followings:

- the width of the label
- the height of the label
- the length of the shorter edge of the label (width or height)
- the length of the longer edge of the label (width or height)

This is useful for labels that change size (e.g. device rotation) or for catering to screen sizes of different devices (e.g., iPhone vs. iPad)

The following figures show the differences:

(insert screen shots here)

## KNOWN ISSUES ##

There are no known issues currently.

## HOW TO INSTALL IT ##

### Using CocoaPod ###

The spec is avabilable in the Trunk of CocoaPods. Below is an example podfile. If you already use a podfile for your project, all you have to do is add the line that specifies `HKUILabel`

```
platform :ios, '11.0'

target 'MyTarget' do

  use_frameworks!

  pod 'HKUILabel', '~> 1.0.0'
  # other pods for your project

end

# This post_install section fixes a bug in CocoaPod that does not allow
# IBDesignables to render in interface builder

post_install do |installer|
installer.pods_project.targets.each do |target|
    target.new_shell_script_build_phase.shell_script = "mkdir -p $PODS_CONFIGURATION_BUILD_DIR/#{target.name}"
        target.build_configurations.each do |config|
            config.build_settings['CONFIGURATION_BUILD_DIR'] = '$PODS_CONFIGURATION_BUILD_DIR'
            config.build_settings.delete('CODE_SIGNING_ALLOWED')
            config.build_settings.delete('CODE_SIGNING_REQUIRED')
        end
    end
end
```

#### ***** IMPORTANT!! ***** ####

If you are installing this as a CocoaPod, you **MUST** include this script at the end of your Podfile or the Inspectables won't work in Interface Builder. However, if you don't, it will still function as expected at runtime. There is no need to include this if you do are not using Interface Builder.

```
# This post_install section fixes a bug in CocoaPod that does not allow
# IBDesignables to render in interface builder

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.new_shell_script_build_phase.shell_script = "mkdir -p $PODS_CONFIGURATION_BUILD_DIR/#{target.name}"
        target.build_configurations.each do |config|
            config.build_settings['CONFIGURATION_BUILD_DIR'] = '$PODS_CONFIGURATION_BUILD_DIR'
            config.build_settings.delete('CODE_SIGNING_ALLOWED')
            config.build_settings.delete('CODE_SIGNING_REQUIRED')
        end
    end
end
```

## HOW TO USE IT ##

### Interface Builder ###

### Programmatically ###
