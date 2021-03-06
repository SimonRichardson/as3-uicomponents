package org.osflash.ui.components.button
{
	import asunit.asserts.assertEquals;
	import org.osflash.dom.element.IDOMDocument;
	import org.osflash.ui.components.themes.graphic.button.UIButtonConfig;
	import org.osflash.ui.components.themes.graphic.button.UIButtonView;
	import org.osflash.ui.display.UIDocument;

	import flash.display.Stage;

	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class ButtonComponentTest
	{
		
		[Inject]
		public var stage : Stage;
		
		private var document : IDOMDocument;
		
		[Before]
		public function setUp() : void
		{
			document = new UIDocument(stage);
		}
		
		[After]
		public function tearDown() : void
		{
			document = null;
		}
		
		[Test]
		public function add_button_to_document() : void
		{
			const config : UIButtonConfig = new UIButtonConfig();
			const view : UIButtonView = new UIButtonView(config);
			const button : UIButton = new UIButton(view);
			
			button.x = 100;
			button.y = 100;
			button.width = 200;
			button.height = 75;
			
			document.add(button);
			
			assertEquals('Document has one item', document.numChildren == 1);
		}
	}
}
