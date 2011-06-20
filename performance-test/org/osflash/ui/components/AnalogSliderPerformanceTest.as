package org.osflash.ui.components
{
	import org.osflash.ui.components.analog.UIAnalogSlider;
	import org.osflash.ui.components.themes.graphic.analog.UIAnalogSliderConfig;
	import org.osflash.ui.components.themes.graphic.analog.UIAnalogSliderView;
	import org.osflash.ui.display.UIDocument;

	import flash.display.Sprite;
	[SWF(backgroundColor="#1d1d1d", frameRate="31", width="800", height="800")]
	public class AnalogSliderPerformanceTest extends Sprite
	{

		/**
		 * @private
		 */
		private var document : UIDocument;

		public function AnalogSliderPerformanceTest()
		{
			document = new UIDocument(stage, true);
			
			for(var i : int = 0; i<1000; i++)
			{
				
				const config : UIAnalogSliderConfig = new UIAnalogSliderConfig();
				const view : UIAnalogSliderView = new UIAnalogSliderView(config);
				const analogSlider : UIAnalogSlider = new UIAnalogSlider(view);
				
				const size : int = (Math.random() * 150) + 150;
				
				analogSlider.width = size;
				analogSlider.height = (Math.random() * 10) + 10;
				
				analogSlider.x = (Math.random() * (800 - analogSlider.width));
				analogSlider.y = (Math.random() * (800 - analogSlider.height));
				
				document.add(analogSlider);
			}
			
			document.invalidate();
		}
	}
}
