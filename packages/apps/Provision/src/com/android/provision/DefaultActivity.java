/*
 * Copyright (C) 2008 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.android.provision;

import android.app.Activity;
import android.content.ComponentName;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.provider.Settings;

/**
 * Application that sets the provisioned bit, like SetupWizard does.
 */
public class DefaultActivity extends Activity {

    @Override
    protected void onCreate(Bundle icicle) {
        super.onCreate(icicle);

        final boolean device_provisioned = Settings.Global.getInt(
                getContentResolver(),
                Settings.Global.DEVICE_PROVISIONED, 0) == 1;
        final boolean user_setup_completed = Settings.Secure.getInt(
                getContentResolver(),
                Settings.Secure.USER_SETUP_COMPLETE, 0) == 1;

        PackageManager pm = getPackageManager();
        ComponentName name;
        if (!device_provisioned || !user_setup_completed) {
            // enable setup wizard for provisioning
            final String setupwizard = "com.google.android.setupwizard";
            final String[] activities = {
                    "com.google.android.setupwizard.SetupWizardActivity",
                    "com.google.android.setupwizard.carrier.MobileDataActivity$HfaChangeReceiver",
                    "com.google.android.setupwizard.util.GservicesChangedReceiver",
                    "com.google.android.setupwizard.account.RestoreService",
                    "com.google.android.setupwizard.carrier.MobileConnectivityChangeReceiver",
                    "com.google.android.setupwizard.util.SetupWizardAdminReceiver",
                    "com.google.android.setupwizard.util.WebDialogActivity",
            };
            for (String activity : activities) {
                try {
                    name = new ComponentName(setupwizard, activity);
                    pm.setComponentEnabledSetting(name,
                            PackageManager.COMPONENT_ENABLED_STATE_DEFAULT, 0);
                } catch (Exception e) { }
            }
        }

        // remove this activity from the package manager.
        name = new ComponentName(this, DefaultActivity.class);
        pm.setComponentEnabledSetting(name, PackageManager.COMPONENT_ENABLED_STATE_DISABLED,
                PackageManager.DONT_KILL_APP);

        // terminate the activity.
        finish();
    }
}

