package org.osflash.ui.components.analog
{
	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;
	import org.osflash.ui.components.component.UIComponentSignalProxy;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class UIAnalogRotaryKnobSignalProxy extends UIComponentSignalProxy
	{
		
		/**
		 * The position of the rotary knob as an angle
		 * @private
		 */
		private const _positionChanged : ISignal = new Signal(Number);
		
		public function get positionChanged() : ISignal { return _positionChanged; }
	}
}
