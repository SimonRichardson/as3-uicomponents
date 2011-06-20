package org.osflash.ui.components
{
	import org.osflash.logger.LogFactory;
	import org.osflash.logger.logger_namespace;
	import org.osflash.logger.output.FirebugOutput;
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
			LogFactory.logger_namespace::DEFAULT_LOGGER.stream.add(new FirebugOutput());
			
			document = new UIDocument(stage, true);
			
			for(var i : int = 0; i<10; i++)
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
