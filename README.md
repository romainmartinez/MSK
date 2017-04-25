# Overview
Welcome to MSK. This repository contains the code for our future paper: Sex differences in musculoskeletal parameters of the upper limb during a lifting task.

Please cite this paper if you use the code in this repository as part of a published research project.

# Structure

```
C:.
│   MSK_forcesensor.m         (load, compute and get data from the force sensor in the global frame)
│   MSK_preparation.m         (used to compute Tau, the joint torque?)
│   README.md                 (documentation) 
│   
└───functions
        col_assign.m          (load c3d channels assignment)
        data_c3dfields.m      (get data from c3d for emg, point and force sensors)
        disp_name.m           (print participant & trial's name)
        get_c3dfields.m
        get_model.m           (get S2M model & informations)
        get_path.m            (get import, export & mat path)
        GUI_c3d.m             (get c3d channels)
        inverse_dynamics.m    (compute inverse dynamics & interpolation)
        load_c3dfields.m      (load c3d data for each participants and trials)
        load_data.m           (load kinematic data) 
        read_c3d.m            (read c3d with btk library)
        ref_channels.m        (reference names for emg, point and force channels)
        strfuzzy.m            (find nearest string match with this fuzzy algo)
        sujets_valides.m      (get participants' name)
```

# Contributors
Romain Martinez, Ph.D. candidate at S2M in Université de Montréal.

