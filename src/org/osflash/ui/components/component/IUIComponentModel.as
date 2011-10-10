package org.osflash.ui.components.component
{
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public interface IUIComponentModel
	{
		
		function bind(component : IUIComponent) : void;
		function unbind() : void;
			
		function get id() : String;
		function set id(value : String) : void;
		
		function get tabIndex() : int;
		function set tabIndex(value : int) : void;

		function get keyChar() : String;
		function set keyChar(value : String) : void;
		
		function get tooltipText() : String;
		function set tooltipText(value : String) : void;
	}
}
