#import "dmzAppDelegate.h"
#import "dmzShipModuleiPhone.h"
#import <dmzObjectAttributeMasks.h>
#import <dmzObjectModule.h>
#import <dmzRuntimeConfigToTypesBase.h>
#import <dmzRuntimePluginFactoryLinkSymbol.h>
#import <dmzRuntimePluginInfo.h>
#import "RootViewController.h"


dmz::ShipModuleiPhone *localInstance (0);
dmz::ShipModuleiPhone *dmz::ShipModuleiPhone::_instance (0);


dmz::ShipModuleiPhone::ShipModuleiPhone (const PluginInfo &Info, Config &local) :
      Plugin (Info),
      ObjectObserverUtil (Info, local),
      _log (Info),
      _rootViewController (0),
      _wave (0),
      _waveSpeedAttributeHandle (0),
      _waveAmplitudeAttributeHandle (0),
      _waveNumberAttributeHandle (0),
      _inUpdate (False),
      _speedMin (0.0),
      _speedRange (5.0),
      _amplitudeMin (0.0),
      _amplitudeRange (30.0),
      _periodMin (20.0),
      _periodRange (980.0) {

   if (!_instance) {
      
      _instance = this;
      localInstance = _instance;
   }

//   [[UIApplication sharedApplication] setStatusBarHidden:YES animated:NO];
   
   _rootViewController = [[RootViewController alloc] 
      initWithNibName:@"RootViewController" bundle:nil];
         
   dmzAppDelegate *app = [dmzAppDelegate shared_dmz_app];

   app.window.backgroundColor = [UIColor blackColor];
   app.rootController = _rootViewController;

   _init (local);
}


dmz::ShipModuleiPhone::~ShipModuleiPhone () {

   [_rootViewController release];
   
   if (localInstance) {
      
      _instance = 0;
      localInstance = 0;
   }
}


dmz::ShipModuleiPhone *
dmz::ShipModuleiPhone::get_instance () { return _instance; }


// Plugin Interface
void
dmz::ShipModuleiPhone::update_plugin_state (
      const PluginStateEnum State,
      const UInt32 Level) {

   if (State == PluginStateInit) {

   }
   else if (State == PluginStateStart) {

//      [[UIApplication sharedApplication] setIdleTimerDisabled:YES];
   }
   else if (State == PluginStateStop) {

//      [[UIApplication sharedApplication] setIdleTimerDisabled:NO];
   }
   else if (State == PluginStateShutdown) {

   }
}


void
dmz::ShipModuleiPhone::discover_plugin (
      const PluginDiscoverEnum Mode,
      const Plugin *PluginPtr) {

   if (Mode == PluginDiscoverAdd) {

   }
   else if (Mode == PluginDiscoverRemove) {

   }
}


// Object Observer Interface
void
dmz::ShipModuleiPhone::create_object (
      const UUID &Identity,
      const Handle ObjectHandle,
      const ObjectType &Type,
      const ObjectLocalityEnum Locality) {

   if (Type.is_of_type (_waveType)) { _wave = ObjectHandle; }
}


void
dmz::ShipModuleiPhone::destroy_object (
      const UUID &Identity,
      const Handle ObjectHandle) {

   if (ObjectHandle == _wave) { _wave = 0; }
}


void
dmz::ShipModuleiPhone::update_object_scalar (
      const UUID &Identity,
      const Handle ObjectHandle,
      const Handle AttributeHandle,
      const Float64 Value,
      const Float64 *PreviousValue) {

   if (False == _inUpdate) {

      if (AttributeHandle == _waveSpeedAttributeHandle) {

         if (_speedRange > 0.0) {

            // _ui.speedLabel->setNum (Value);
            // _ui.speedSlider->setValue (int (((Value - _speedMin) / _speedRange) * 100.0));
         }
      }
      else if (AttributeHandle == _waveAmplitudeAttributeHandle) {

         if (_amplitudeRange > 0.0) {

            // _ui.amplitudeLabel->setNum (Value);
            // _ui.amplitudeSlider->setValue (
            //    int (((Value - _amplitudeMin) / _amplitudeRange) * 100.0));
         }
      }
      else if (AttributeHandle == _waveNumberAttributeHandle) {

         if ((Value > 0.0) && (_periodRange > 0.0)) {

            // _ui.periodLabel->setNum (1.0 / Value);
            // _ui.periodSlider->setValue (
            //    int ((((1.0 / Value) - _periodMin) / _periodRange) * 100.0));
         }
      }
   }
}


// class Interface

void
dmz::ShipModuleiPhone::set_wave_speed (const Float64 Value) {

   const Float64 Update = (Value * 0.01 * _speedRange) + _speedMin;
   _update_attribute (_waveSpeedAttributeHandle, Update);
}


void
dmz::ShipModuleiPhone::set_wave_amplitude (const Float64 Value) {
 
   const Float64 Update = (Value * 0.01 * _amplitudeRange) + _amplitudeMin;
   _update_attribute (_waveAmplitudeAttributeHandle, Update);
}


void
dmz::ShipModuleiPhone::set_wave_period (const Float64 Value) {

   const Float64 Update = (Value * 0.01 * _periodRange) + _periodMin;
   _update_attribute (_waveNumberAttributeHandle, Update > 0.0 ? 1.0 / Update : 0.001);
}


void
dmz::ShipModuleiPhone::_update_attribute (const Handle Attribute, const Float64 Value) {

   _inUpdate = True;

   ObjectModule *objMod = get_object_module ();

   if (objMod && _wave) { objMod->store_scalar (_wave, Attribute, Value); }

   _inUpdate = False;
}



void
dmz::ShipModuleiPhone::_init (Config &local) {

   RuntimeContext *context (get_plugin_runtime_context ());

   activate_default_object_attribute (ObjectCreateMask | ObjectDestroyMask);

   _waveSpeedAttributeHandle = activate_object_attribute (
      config_to_string ("wave-speed-attribute.name", local, "DMZ_Wave_State_Speed"),
      ObjectScalarMask);

   _waveAmplitudeAttributeHandle = activate_object_attribute (
      config_to_string (
         "wave-amplitude-attribute.name",
         local,
         "DMZ_Wave_State_Amplitude"),
      ObjectScalarMask);

   _waveNumberAttributeHandle = activate_object_attribute (
      config_to_string ("wave-number-attribute.name", local, "DMZ_Wave_State_Number"),
      ObjectScalarMask);

   _waveType = config_to_object_type ("wave-type.name", local, "wave-state", context);
}


extern "C" {

DMZ_PLUGIN_FACTORY_LINK_SYMBOL dmz::Plugin *
create_dmzShipModuleiPhone (
      const dmz::PluginInfo &Info,
      dmz::Config &local,
      dmz::Config &global) {

   return new dmz::ShipModuleiPhone (Info, local);
}

};
