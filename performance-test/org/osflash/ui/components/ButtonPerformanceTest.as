package org.osflash.ui.components
{
	import org.osflash.ui.components.button.UIButton;
	import org.osflash.ui.components.button.graphic.UIGraphicButtonView;
	import org.osflash.ui.display.UIDocument;

	import flash.display.Sprite;
	[SWF(backgroundColor="#1d1d1d", frameRate="31", width="800", height="800")]
	public class ButtonPerformanceTest extends Sprite
	{

		/**
		 * @private
		 */
		private var document : UIDocument;

		public function ButtonPerformanceTest()
		{
			document = new UIDocument(stage, true);
			
			for(var i : int = 0; i<1; i++)
			{
				const view : UIGraphicButtonView = new UIGraphicButtonView();
				const button : UIButton = new UIButton(view);
				
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
