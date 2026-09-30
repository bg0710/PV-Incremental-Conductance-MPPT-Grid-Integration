# PV System with Incremental Conductance MPPT and Grid Integration

MATLAB/Simulink model of a PV system using **Incremental Conductance MPPT**, DC-link PI control, a single-phase full-bridge VSC, PLL synchronization, PR current control and PWM-based grid integration.

## Power and control path

**PV Array → INC MPPT → DC-Link PI Control → Full-Bridge VSC → Filter → Grid**

## Key parameters

| Parameter | Value |
|---|---:|
| PV modules in series | 12 |
| PV modules in parallel | 1 |
| Module rated power | 235.008 W |
| Module Vmp / Imp | 30.6 V / 7.68 A |
| Array Vmp | 367.2 V |
| Array Voc | 440.64 V |
| Array nominal MPP power | ≈ 2.82 kW |
| PV temperature | 25 °C |
| Irradiance test | 500 → 1000 W/m² |
| Irradiance step | 0.5 s |
| DC-link capacitor | 1000 µF |
| DC-link initial voltage | 500 V |
| DC-link PI | Kp = 0.3, Ki = 0.1 |
| Grid voltage | 325 V peak (≈230 V RMS) |
| Grid frequency | 50 Hz |
| PR controller | kp = 1.2, kr = 750, f = 50 Hz |
| PWM carrier | ≈5 kHz |
| Powergui sample time | 1 µs |
| Simulation stop time | 2 s |

## Repository structure

```text
PV_Incremental_Conductance_Grid_Integration/
├── 01_Model/
│   └── sgs_assin_2.slx
├── 02_Controller/
│   ├── INC_MPPT.m
│   └── PR_Controller.md
├── 03_Documentation/
│   ├── PV_Incremental_Conductance_Grid_Integration_Report.docx
│   └── PV_Incremental_Conductance_Grid_Integration_Report.pdf
├── 04_Figures/
│   └── system_model.png
├── 05_Results/
│   └── README.md
└── README.md
```

## Running the model

Open `01_Model/sgs_assin_2.slx` in MATLAB/Simulink with the required Simscape Electrical libraries. Run for 2 seconds and inspect the PV/DC-link and grid-side scopes.

## Important verification note

The AC source and PLL are configured for **50 Hz**, while the supplied powergui configuration contains a stored fundamental-frequency value of **60 Hz**. For a final 50-Hz study, make the powergui analysis/fundamental-frequency setting consistent before reporting RMS/FFT results.

## Results

The repository contains the supplied model screenshot. Exported time-series plots should be added after the final simulation for PV power, DC-link voltage, grid current/reference and FFT/THD.

## Publishing note

If this is a course/lab submission, check your institution's rules before publishing the `.slx` file. The repository can also contain the report and controller code while the Simulink model is kept private if required.
