package org.osflash.ui.components.component
{
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public interface IUIComponentState
	{
		
		function get enabled() : Boolean;
		function set enabled(value : Boolean) : void;

		function get hovered() : Boolean;
		function set hovered(value : Boolean) : void;

		function get focused() : Boolean;
		function set focused(value : Boolean) : void;

		function get pressed() : Boolean;
		function set pressed(value : Boolean) : void;
	}
}
