#include <string.h>

#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>

#include "vendor_init.h"

void property_override(char const prop[], char const value[])
{
    prop_info *pi;

    pi = (prop_info*) __system_property_find(prop);
    if (pi)
        __system_property_update(pi, value, strlen(value));
    else
        __system_property_add(prop, strlen(prop), value, strlen(value));
}

void property_override_triple(char const product_prop[], char const system_prop[], char const vendor_prop[], char const value[])
{
    property_override(product_prop, value);
    property_override(system_prop, value);
    property_override(vendor_prop, value);
}

bool property_equal_char(char const prop[], char const value[])
{
    bool ret = false;
    char system_prop[PROP_VALUE_MAX];

    __system_property_get(prop, system_prop);
    if(strncmp(system_prop, value, 1) == 0) {
        ret = true;
    }
    
    return ret;
}

int device_model_get()
{
    int ret;

    ret = 0;

    if(property_equal_char("ro.boot.id.prj", "7") && property_equal_char("ro.boot.id.rf", "5")) {
        // Z00ED
        ret = 1;
    } else if(property_equal_char("ro.boot.id.prj", "3") && property_equal_char("ro.boot.id.rf", "0"))  {
        // Z00RD
        ret = 2;
    }

    return ret;
}

void vendor_load_properties()
{
    int device_model;

    device_model = device_model_get();

    if (device_model == 1) {
        property_override_triple("ro.product.device", "ro.product.system.device", "ro.product.vendor.device", "ASUS_Z00E_2");	
        property_override_triple("ro.product.model", "ro.product.system.model", "ro.product.vendor.model", "ASUS_Z00ED");	
        property_override("ro.product.name", "ZE500KL");
        property_override_triple("ro.build.fingerprint", "ro.system.build.fingerprint", "ro.vendor.build.fingerprint", "asus/WW_Phone/ASUS_Z00E_2:6.0.1/MMB29P/13.1010.1612.53-20170202:user/release-keys");
        property_override_triple("ro.build.description", "ro.system.build.description", "ro.vendor.description", "WW_Phone-user 6.0.1 MMB29P 13.1010.1612.53-20170202 release-keys");
    } else if (device_model == 2) {
        property_override_triple("ro.product.device", "ro.product.system.device", "ro.product.vendor.device", "ASUS_Z00RD_1");	
        property_override_triple("ro.product.model", "ro.product.system.model", "ro.product.vendor.model", "ASUS_Z00RD");	
        property_override("ro.product.name", "ZE500KG");
        property_override_triple("ro.build.fingerprint", "ro.system.build.fingerprint", "ro.vendor.build.fingerprint", "asus/WW_Phone/ASUS_Z00RD_1:6.0.1/MMB29P/13.10.10.25-20160523:user/release-keys");
        property_override_triple("ro.build.description", "ro.system.build.description", "ro.vendor.description", "WW_Phone-user 6.0.1 MMB29P 13.10.10.25-20160523 release-keys");
        property_override("ro.power_profile.override", "power_profile_2");
    }
    // Init a dummy BT MAC address, will be overwritten later
    property_override("ro.boot.btmacaddr", "00:00:00:00:00:00");
    property_override("ro.debuggable", "0");
    property_override_triple("ro.build.type", "ro.system.build.type", "ro.vendor.build.type", "user");	
    property_override_triple("ro.build.tags", "ro.system.build.tags", "ro.vendor.build.tags", "release-keys");	
}
