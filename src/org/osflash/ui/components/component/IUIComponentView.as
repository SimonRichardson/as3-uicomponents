package org.osflash.ui.components.component
{
	import org.osflash.ui.signals.ISignalTarget;

	import flash.geom.Point;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public interface IUIComponentView
	{
		
		function bind(component : IUIComponent) : void;
		function unbind() : void;
		
		function captureTarget(point : Point) : ISignalTarget;
	}
}
