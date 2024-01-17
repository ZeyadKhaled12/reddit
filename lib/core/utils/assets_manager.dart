class VideoAssets {
  static const String textVideo = 'assets/videos/test_video.mp4';
}

class SvgAssets {
  static String downloadIcon() => '''
<?xml version="1.0" encoding="utf-8"?>
<!-- Generator: Adobe Illustrator 18.1.1, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 1086.1 1149.1" enable-background="new 0 0 1086.1 1149.1" xml:space="preserve">
<g id="Layer_2" display="none">
	<path display="inline" fill="none" stroke="#FFFFFF" stroke-width="100" stroke-miterlimit="10" d="M1048.8,175.6v548.2
		c0,80.8-64.4,146.2-143.7,146.2H725.3l-291.1,240.6c-30.4,25.1-76.3,3.5-76.3-35.9V870H181.6c-79.4,0-143.7-65.4-143.7-146.2V175.6
		c0-80.8,64.3-146.2,143.7-146.2h723.6C984.5,29.4,1048.8,94.9,1048.8,175.6z"/>
</g>
<g id="Layer_3" display="none">
	
		<image display="inline" overflow="visible" width="49" height="49" xlink:href="C2C1C72D.jpg"  transform="matrix(1 0 0 1 1307 459)">
	</image>
</g>
<g id="Layer_4">
	<path fill="none" stroke="#FFFFFF" stroke-width="100" stroke-miterlimit="10" d="M977.2,556.6v254.1c0,92.3-74.8,167.1-167.1,167.1
		H276.6c-92.3,0-167.1-74.8-167.1-167.1V556.6"/>
	<line fill="none" stroke="#FFFFFF" stroke-width="100" stroke-miterlimit="10" x1="543.4" y1="125.2" x2="543.4" y2="810.3"/>
	<path fill="none" stroke="#FFFFFF" stroke-width="100" stroke-miterlimit="10" d="M763.8,366.7L584.1,162.9
		c-21.5-24.4-59.6-24.1-80.8,0.5L328.6,366.7"/>
</g>
</svg>
''';
  static String messageBuble({double strokeSize = 20}) => '''
<?xml version="1.0" encoding="utf-8"?>
<!-- Generator: Adobe Illustrator 18.1.1, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
<svg version="1.1" id="Layer_2" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 1086.1 1149.1" enable-background="new 0 0 1086.1 1149.1" xml:space="preserve">
<path fill="none" stroke="#FFFFFF" stroke-width="$strokeSize" stroke-miterlimit="10" d="M1048.8,175.6v548.2c0,80.8-64.4,146.2-143.7,146.2
	H725.3l-291.1,240.6c-30.4,25.1-76.3,3.5-76.3-35.9V870H181.6c-79.4,0-143.7-65.4-143.7-146.2V175.6c0-80.8,64.3-146.2,143.7-146.2
	h723.6C984.5,29.4,1048.8,94.9,1048.8,175.6z"/>
</svg>
''';

  static String arrowUp(
          {String colorHex = 'EE3A24',
          String strokeSize = '9',
          String strokeColor = 'FFFFFF'}) =>
      '''
<?xml version="1.0" encoding="utf-8"?>
<!-- Generator: Adobe Illustrator 18.1.1, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
<svg version="1.1" id="Layer_2" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 149.2 185.7" enable-background="new 0 0 149.2 185.7" xml:space="preserve">
<path fill="#$colorHex" stroke="#$strokeColor" stroke-width="$strokeSize" stroke-miterlimit="10" d="M125,107.9h-16.9v58.2c0,2.4-2,4.4-4.4,4.4H47.8
	c-2.4,0-4.4-2-4.4-4.4v-58.2H24.1c-11.2,0-17.5-12.8-10.7-21.6l50.5-65.8c5.4-7,16-7,21.4,0l50.5,65.8
	C142.5,95.1,136.2,107.9,125,107.9z"/>
</svg>
''';
}
