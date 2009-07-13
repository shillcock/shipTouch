#include <dmzRuntimeConfig.h>
#include <dmzRuntimePlugin.h>
#include <dmzRuntimePluginContainer.h>
#include <dmzRuntimePluginInfo.h>

extern "C" {
dmz::Plugin *create_dmzArchiveModuleBasic (const dmz::PluginInfo &Info, dmz::Config &local, dmz::Config &global);
dmz::Plugin *create_dmzArchivePluginAutoLoad (const dmz::PluginInfo &Info, dmz::Config &local, dmz::Config &global);
dmz::Plugin *create_dmzArchivePluginObject (const dmz::PluginInfo &Info, dmz::Config &local, dmz::Config &global);
dmz::Plugin *create_dmzObjectModuleBasic (const dmz::PluginInfo &Info, dmz::Config &local, dmz::Config &global);
dmz::Plugin *create_dmzNetPluginPacket (const dmz::PluginInfo &Info, dmz::Config &local, dmz::Config &global);
dmz::Plugin *create_dmzNetPluginRemoteDR (const dmz::PluginInfo &Info, dmz::Config &local, dmz::Config &global);
dmz::Plugin *create_dmzNetModuleLocalDRBasic (const dmz::PluginInfo &Info, dmz::Config &local, dmz::Config &global);
dmz::Plugin *create_dmzNetPluginRemoteTimeout (const dmz::PluginInfo &Info, dmz::Config &local, dmz::Config &global);
dmz::Plugin *create_dmzNetModulePacketCodecBasic (const dmz::PluginInfo &Info, dmz::Config &local, dmz::Config &global);
dmz::Plugin *create_dmzNetModulePacketIOHawkNL (const dmz::PluginInfo &Info, dmz::Config &local, dmz::Config &global);
dmz::Plugin *create_dmzNetModuleAttributeMapBasic (const dmz::PluginInfo &Info, dmz::Config &local, dmz::Config &global);
dmz::Plugin *create_dmzNetExtPacketCodecObjectNative (const dmz::PluginInfo &Info, dmz::Config &local, dmz::Config &global);
dmz::Plugin *create_dmzShipModuleiPhone (const dmz::PluginInfo &Info, dmz::Config &local, dmz::Config &global);
}

void
dmz_create_plugins (
      dmz::RuntimeContext *context,
      dmz::Config &config,
      dmz::Config &global,
      dmz::PluginContainer &container) {

   dmz::PluginInfo *info (0);
   dmz::Config local;

   info = new dmz::PluginInfo ("dmzArchiveModuleBasic", dmz::PluginDeleteModeDelete, context, 0);
   local.set_config_context (0);
   config.lookup_all_config_merged ("dmzArchiveModuleBasic", local);
   container.add_plugin (info, create_dmzArchiveModuleBasic (*info, local, global));

   info = new dmz::PluginInfo ("dmzArchivePluginAutoLoad", dmz::PluginDeleteModeDelete, context, 0);
   local.set_config_context (0);
   config.lookup_all_config_merged ("dmzArchivePluginAutoLoad", local);
   container.add_plugin (info, create_dmzArchivePluginAutoLoad (*info, local, global));

   info = new dmz::PluginInfo ("dmzArchivePluginObject", dmz::PluginDeleteModeDelete, context, 0);
   local.set_config_context (0);
   config.lookup_all_config_merged ("dmzArchivePluginObject", local);
   container.add_plugin (info, create_dmzArchivePluginObject (*info, local, global));

   info = new dmz::PluginInfo ("dmzObjectModuleBasic", dmz::PluginDeleteModeDelete, context, 0);
   local.set_config_context (0);
   config.lookup_all_config_merged ("dmzObjectModuleBasic", local);
   container.add_plugin (info, create_dmzObjectModuleBasic (*info, local, global));

   info = new dmz::PluginInfo ("dmzNetPluginPacket", dmz::PluginDeleteModeDelete, context, 0);
   local.set_config_context (0);
   config.lookup_all_config_merged ("dmzNetPluginPacket", local);
   container.add_plugin (info, create_dmzNetPluginPacket (*info, local, global));

   info = new dmz::PluginInfo ("dmzNetPluginRemoteDR", dmz::PluginDeleteModeDelete, context, 0);
   local.set_config_context (0);
   config.lookup_all_config_merged ("dmzNetPluginRemoteDR", local);
   container.add_plugin (info, create_dmzNetPluginRemoteDR (*info, local, global));

   info = new dmz::PluginInfo ("dmzNetModuleLocalDRBasic", dmz::PluginDeleteModeDelete, context, 0);
   local.set_config_context (0);
   config.lookup_all_config_merged ("dmzNetModuleLocalDRBasic", local);
   container.add_plugin (info, create_dmzNetModuleLocalDRBasic (*info, local, global));

   info = new dmz::PluginInfo ("dmzNetPluginRemoteTimeout", dmz::PluginDeleteModeDelete, context, 0);
   local.set_config_context (0);
   config.lookup_all_config_merged ("dmzNetPluginRemoteTimeout", local);
   container.add_plugin (info, create_dmzNetPluginRemoteTimeout (*info, local, global));

   info = new dmz::PluginInfo ("dmzNetModulePacketCodecBasic", dmz::PluginDeleteModeDelete, context, 0);
   local.set_config_context (0);
   config.lookup_all_config_merged ("dmzNetModulePacketCodecBasic", local);
   container.add_plugin (info, create_dmzNetModulePacketCodecBasic (*info, local, global));

   info = new dmz::PluginInfo ("dmzNetModulePacketIOHawkNL", dmz::PluginDeleteModeDelete, context, 0);
   local.set_config_context (0);
   config.lookup_all_config_merged ("dmzNetModulePacketIOHawkNL", local);
   container.add_plugin (info, create_dmzNetModulePacketIOHawkNL (*info, local, global));

   info = new dmz::PluginInfo ("dmzNetModuleAttributeMapBasic", dmz::PluginDeleteModeDelete, context, 0);
   local.set_config_context (0);
   config.lookup_all_config_merged ("dmzNetModuleAttributeMapBasic", local);
   container.add_plugin (info, create_dmzNetModuleAttributeMapBasic (*info, local, global));

   info = new dmz::PluginInfo ("NetCodecWaveState", dmz::PluginDeleteModeDelete, context, 0);
   local.set_config_context (0);
   config.lookup_all_config_merged ("NetCodecWaveState", local);
   container.add_plugin (info, create_dmzNetExtPacketCodecObjectNative (*info, local, global));

   info = new dmz::PluginInfo ("dmzShipModuleiPhone", dmz::PluginDeleteModeDelete, context, 0);
   local.set_config_context (0);
   config.lookup_all_config_merged ("dmzShipModuleiPhone", local);
   container.add_plugin (info, create_dmzShipModuleiPhone (*info, local, global));
}
