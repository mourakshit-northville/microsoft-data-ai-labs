# Power BI

This section covers semantic modeling, Direct Lake, DAX, developer/embedded scenarios, governance, and how Power BI participates in the broader Microsoft Fabric architecture.

## Lab ideas

### Semantic model design
- Build a star schema with explicit measures.
- Define reusable business calculations in DAX.
- Validate filter direction and relationship behavior.
- Compare import, DirectQuery, and Direct Lake design considerations.

### Direct Lake lab
- Build a semantic model over Fabric data in OneLake.
- Validate performance and fallback behavior.
- Compare the operational implications with import mode.

### Developer/API lab
- Use Power BI APIs or embedding patterns for controlled application integration.
- Automate metadata inspection or deployment tasks.
- Keep service principal and permission boundaries explicit.

## Architecture questions

- Which business definitions belong in the semantic model?
- Which calculations should be upstream versus DAX?
- How do semantic models contribute context to Fabric IQ and agents?
- What governance is required for reusable enterprise metrics?

## Upstream references

- [microsoft/PowerBI-Developer-Samples](https://github.com/microsoft/PowerBI-Developer-Samples)
- [microsoft/powerbi-desktop-samples](https://github.com/microsoft/powerbi-desktop-samples)
- [microsoft/Fabric-metadata-scanning](https://github.com/microsoft/Fabric-metadata-scanning)
