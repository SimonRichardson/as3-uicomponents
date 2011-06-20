package org.osflash.ui.components
{
	import org.osflash.ui.components.analog.UIAnalogStick;
	import org.osflash.ui.components.themes.graphic.analog.UIGraphicAnalogStickConfig;
	import org.osflash.ui.components.themes.graphic.analog.UIGraphicAnalogStickView;
	import org.osflash.ui.display.UIDocument;

	import flash.display.Sprite;

	[SWF(backgroundColor="#1d1d1d", frameRate="31", width="800", height="800")]
	public class AnalogStickPerformanceTest extends Sprite
	{

		/**
		 * @private
		 */
		private var document : UIDocument;

		public function AnalogStickPerformanceTest()
		{
			document = new UIDocument(stage, true);
			
			for(var i : int = 0; i<1000; i++)
			{
				
				const config : UIGraphicAnalogStickConfig = new UIGraphicAnalogStickConfig();
				const view : UIGraphicAnalogStickView = new UIGraphicAnalogStickView(config);
				const analogStick : UIAnalogStick = new UIAnalogStick(view);
				
				const size : int = (Math.random() * 300) + 50;
				
				analogStick.width = size;
				analogStick.height = size;
				
				analogStick.x = (Math.random() * (800 - analogStick.width));
				analogStick.y = (Math.random() * (800 - analogStick.height));
				
				document.add(analogStick);
			}
			
			document.invalidate();
		}
	}
}