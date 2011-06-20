package org.osflash.ui.components
{
	import org.osflash.ui.components.analog.UIAnalogRotaryKnob;
	import org.osflash.ui.components.themes.graphic.analog.UIAnalogRotaryKnobConfig;
	import org.osflash.ui.components.themes.graphic.analog.UIAnalogRotaryKnobView;
	import org.osflash.ui.display.UIDocument;

	import flash.display.Sprite;
	[SWF(backgroundColor="#1d1d1d", frameRate="31", width="800", height="800")]
	public class AnalogRotaryKnobPerformanceTest extends Sprite
	{

		/**
		 * @private
		 */
		private var document : UIDocument;

		public function AnalogRotaryKnobPerformanceTest()
		{
			document = new UIDocument(stage, true);
			
			for(var i : int = 0; i<200; i++)
			{
				const config : UIAnalogRotaryKnobConfig = 
															new UIAnalogRotaryKnobConfig();
				const view : UIAnalogRotaryKnobView = 
														new UIAnalogRotaryKnobView(config);
				const analogRotaryKnob : UIAnalogRotaryKnob = new UIAnalogRotaryKnob(view);
				
				const size : int = (Math.random() * 300) + 50;
				
				analogRotaryKnob.width = size;
				analogRotaryKnob.height = size;
				
				analogRotaryKnob.x = (Math.random() * (800 - analogRotaryKnob.width));
				analogRotaryKnob.y = (Math.random() * (800 - analogRotaryKnob.height));
				
				document.add(analogRotaryKnob);
			}
			
			document.invalidate();
		}
	}
}
