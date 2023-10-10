## Tables

- **Policy**: Holds general information about the policies such as *Policy Number*, *Policy Inception Date*, *Policy Expiration Date*, etc.
- **Vehicle**: Keeps information about the insured vehicles. There could be more than one vehicle under a single policy, i.e. there is a *one-to-many* relationship between **Policy** and **Vehicle**.
- **Driver**: Houses details about the drivers involved with *policies that cover vehicles*. There can be more than one driver per policy, i.e. *one-to-many* relationship between **Policy** and **Driver**. Some driver attributes are *Driver Name*, *Date of Birth*, *SSN*, *Driver License Number*, etc.
- **VehicleDriver**: Combines vehicle and driver to manage the *many-to-many* relationship between **Driver** and **Vehicle** in the form of a *bridge table*. 
- **DriverAddress**:
- **TrafficViolationCode**
- **DriverTrafficViolationRecord**:
- **Bill**
- **PaymentDetail**:
- **Coverage**:
- **PolicyCoverage**:
- **VehicleCoverage**:
- **PolicyEditLog**:
