#ifndef DMZ_SHIP_MODULE_IPHONE_DOT_H
#define DMZ_SHIP_MODULE_IPHONE_DOT_H

#import <dmzObjectObserverUtil.h>
#import <dmzRuntimeLog.h>
#import <dmzRuntimeObjectType.h>
#import <dmzRuntimePlugin.h>
#import <dmzTypesHashTableHandleTemplate.h>

@class RootViewController;


namespace dmz {

   class ShipModuleiPhone :
         public Plugin,
         public ObjectObserverUtil {

      public:
         static ShipModuleiPhone *get_instance ();

         ShipModuleiPhone (const PluginInfo &Info, Config &local);
         ~ShipModuleiPhone ();

         // Plugin Interface
         virtual void update_plugin_state (
            const PluginStateEnum State,
            const UInt32 Level);

         virtual void discover_plugin (
            const PluginDiscoverEnum Mode,
            const Plugin *PluginPtr);

         // Object Observer Interface
         virtual void create_object (
            const UUID &Identity,
            const Handle ObjectHandle,
            const ObjectType &Type,
            const ObjectLocalityEnum Locality);

         virtual void destroy_object (const UUID &Identity, const Handle ObjectHandle);

         virtual void update_object_scalar (
            const UUID &Identity,
            const Handle ObjectHandle,
            const Handle AttributeHandle,
            const Float64 Value,
            const Float64 *PreviousValue);
            
         // Class Interface
         void set_wave_speed (const Float64 Value);
         void set_wave_amplitude (const Float64 Value);
         void set_wave_period (const Float64 Value);
            
         Float64 calc_wave_speed (const Float64 Value);
         Float64 calc_wave_amplitude (const Float64 Value);            
         Float64 calc_wave_period (const Float64 Value);
         
      protected:
         static ShipModuleiPhone *_instance;
         
         void _update_attribute (const Handle Attribute, const Float64 Value);
         void _init (Config &local);

         Log _log;
         RootViewController *_rootViewController;
         HashTableHandleTemplate<UIView> _itemTable;
         ObjectType _waveType;
         Handle _wave;
         Handle _waveSpeedAttributeHandle;
         Handle _waveAmplitudeAttributeHandle;
         Handle _waveNumberAttributeHandle;
         Boolean _inUpdate;
         Float64 _speedMin;
         Float64 _speedRange;
         Float64 _amplitudeMin;
         Float64 _amplitudeRange;
         Float64 _periodMin;
         Float64 _periodRange;
         
      private:
         ShipModuleiPhone ();
         ShipModuleiPhone (const ShipModuleiPhone &);
         ShipModuleiPhone &operator= (const ShipModuleiPhone &);
   };
};

#endif // DMZ_SHIP_MODULE_IPHONE_DOT_H
