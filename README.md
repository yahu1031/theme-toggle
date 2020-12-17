# theme_toggle

The ThemeToggle widget is a custom and fancy toggle switch for Themes. You can use custom emoji for on(Dark) and off(light).

## Previews

### Rotating Toggle button

<img src="./assets/rotate.gif"  height=300/>

Just give rotation as true then the emoji rotate on the toggle click.

```dart
ThemeToggle(
  iconOffSize: 30,
  iconOnSize: 30,
  rotation: true,
  onChanged: (bool change) {
    setState(() {
      change = !change;
      change ? theme = 'Dark' : theme = 'Light';
    });
  },
)
```

### Fading Toggle button

<img src="./assets/fade.gif" height=300/>

Just give rotation as false then it changes to fade animation.

```dart
ThemeToggle(
  iconOffSize: 30,
  iconOnSize: 30,
  rotation: false,
  onChanged: (bool change) {
    setState(() {
      change = !change;
      change ? theme = 'Dark' : theme = 'Light';
    });
  },
)
```

## Author

[Minnu](https://github.com/yahu1031/)

## License

[MIT](https://github.com/yahu1031/theme-toggle/blob/main/LICENSE)
