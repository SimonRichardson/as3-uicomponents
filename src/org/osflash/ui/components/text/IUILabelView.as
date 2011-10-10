package org.osflash.ui.components.text
{
	import org.osflash.ui.components.component.IUIComponentView;
	import org.osflash.ui.utils.UIAlignment;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public interface IUILabelView extends IUIComponentView
	{
		
		function get textAlignment() : UIAlignment;
		function set textAlignment(value : UIAlignment) : void;

		function get iconAlignment() : UIAlignment;
		function set iconAlignment(value : UIAlignment) : void;

		function get iconTextSpace() : int;
		function set iconTextSpace(value : int) : void;

		function get fontSize() : int;
		function set fontSize(value : int) : void;

		function get fontColor() : int;
		function set fontColor(value : int) : void;

		function get italic() : Boolean;
		function set italic(value : Boolean) : void;

		function get bold() : Boolean;
		function set bold(value : Boolean) : void;

		function get lineSpacing() : int;
		function set lineSpacing(value : int) : void;

		function get autoEllipsis() : Boolean;
		function set autoEllipsis(value : Boolean) : void;

		function get bindIconToText() : Boolean;
		function set bindIconToText(value : Boolean) : void;

		function get backgroundColor() : int;
		function set backgroundColor(value : int) : void;

		function get backgroundAlpha() : Number;
		function set backgroundAlpha(value : Number) : void;
		
		function get textFormat() : UITextFormat;
		function set textFormat(value : UITextFormat) : void;
		
		function get breakOpportunity() : String;
		function set breakOpportunity(value : String) : void;
	}
}
