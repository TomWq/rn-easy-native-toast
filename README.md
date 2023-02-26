# rn-easy-native-toast

This is toast based on native Android and Ios implementations

## Requirements

- iOS 9+
- Android 5.0+
- RN 0.60+

## Installation

### Installation with React Native

Start by adding the package and linking it.

```sh
$ yarn add rn-easy-native-toast
```

### iOS Specific Setup

#### Install pods

```sh
$ cd ios && pod install && cd ..
```

### Android-specific Setup

```java
import com.rntoast.RnToastModule;

public class MainApplication extends Application implements ReactApplication {
  ...
  @Override
  public void onCreate() {
    super.onCreate();
    SoLoader.init(this, /* native exopackage */ false);
    RnToastModule.init(this);
    ....
  }
  ....
}

```

## Usage

```js
import { RnToast } from 'rn-easy-native-toast';

RnToast.show("this is a toast message);
```

## Credits

- rn-easy-native-toas Android built from [Toaster](https://github.com/getActivity/Toaster)

## License

MIT
