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
			
			const config : UIGraphicAnalogStickConfig = new UIGraphicAnalogStickConfig();
			
			for(var i : int = 0; i<1; i++)
			{
				const view : UIGraphicAnalogStickView = new UIGraphicAnalogStickView(config);
				const button : UIAnalogStick = new UIAnalogStick(view);
				
				button.width = 100;
				button.height = 75;
				
				button.x = (Math.random() * (800 - button.width));
				button.y = (Math.random() * (800 - button.height));
				
				document.add(button);
			}
			
			document.invalidate();
		}

	}
}
