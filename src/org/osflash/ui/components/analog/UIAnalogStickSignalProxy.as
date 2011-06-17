package org.osflash.ui.components.analog
{
	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;
	import org.osflash.ui.components.component.UIComponentSignalProxy;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class UIAnalogStickSignalProxy extends UIComponentSignalProxy
	{
		
		/**
		 * The x-pos, y-pos and the distance from the center.
		 * @private
		 */
		private const _positionChanged : ISignal = new Signal(Number, Number, Number);
		
		public function get positionChanged() : ISignal { return _positionChanged; }
	}
}
