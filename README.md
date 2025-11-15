# OMG Systems Modeling Language™ (SysML®) v2 Release

The [SysML v2 Release](https://github.com/Systems-Modeling/SysML-v2-Release) repository contains the latest incremental release of the SysML v2 specification documents, 
example models and model library. It also provides instructions for user installation of SysML v2 Pilot Implementation editors. For developer installs, please see the
development repositories also available from the [Systems Modeling](https://github.com/Systems-Modeling) organization on GitHub.

## Team

This implementation is maintained by the Reference Implementation Working Group of the [OMG® Systems Modeling Community (SMC)](https://www.omg.org/communities/systems-modeling-community.htm). 
The SMC is a community for systems modeling end users, tool vendors and academia to share practices that promote the adoption and advancement of Model-Based Systems Engineering (MBSE). 
It's purpose is to:
* Provide a forum for systems modeling end users, tool vendors and academia to share practices that promote the adoption and advancement of Model-Based Systems Engineering (MBSE).
* Act as a bridge to the OMG Standard Development Organization (SDO) process, providing validated inputs to the SDO to update relevant specifications based on evolving user needs, including the Kernel Modeling Language (KerML), the OMG Systems Modeling Language™ (SysML®) and Systems Modeling API & Services.
* Provide support for building other modeling languages and domain-specific extensions based on KerML and/or SysML.

## Specifications

In June 2023, the OMG adopted the following three _beta specifications_ for KerML, SysML v2 and the Systems Modeling API, which then entered the OMG _finalization_ process. Since then, the SMC Reference Implementation Working Group has continued to publish incremental releases of the pilot implementation, in support of the work of the three finalization task forces.

After the completion of the finalization task forces, the OMG has published final beta versions of the specifications: 

* [Kernel Modeling Language (KerML), version 1.0](https://www.omg.org/spec/KerML/1.0/Beta4)
* [OMG Systems Modeling Language (SysML), version 2.0](https://www.omg.org/spec/SysML/2.0/Beta4)
* [Systems Modeling Application Programming Interface (API) and Services, version 1.0](https://www.omg.org/spec/SystemsModelingAPI/1.0/Beta3)

As of 30 June 2025, these specifications have now been formally adopted by OMG. It is expected that the corresponding _formal specifications_ will be published later in 2025.

## Feedback

To ask questions about using this release or to provide feedback, join the SysML v2 Release Google Group.

   * Go to [https://groups.google.com/g/sysml-v2-release](https://groups.google.com/g/sysml-v2-release) while logged into a Google account. 
   * Select “Apply for Membership”. <br/>
     * Please provide your full name, organizational affiliation and interest in SysML.
   * Once your application has been accepted, you can post to the group using the email 
     [sysml-v2-release@googlegroups.com](mailto:sysml-v2-release@googlegroups.com). 
 
## Release Content

The release repository contains the items listed below. For a Zip archive of the entire repository contents, go to 
[https://github.com/Systems-Modeling/SysML-v2-Release/releases](https://github.com/Systems-Modeling/SysML-v2-Release/releases) and download the appropriate version.

  * In the `doc` directory.
    * Introductory presentations on the SysML v2 notation
        * `Intro to the SysML v2 Language-Textual Notation.pdf`
        * `Intro to the SysML v2 Language-Graphical Notation.pdf`
    * Specification documents (PDF)
      1. Kernel Modeling Language (KerML), version 1.0
      2. OMG Systems Modeling Language (SysML), version 2.0
         - Part 1: Language Specification
         - Part 2: SysML v1 to v2 Transformation
      3. Systems Modeling Application Programming Interface (API) and Services, version 1.0
  * In the `install` directory
    * `eclipse` - Installer for Eclipse plugins for Kernel Modeling Language (KerML) and System Modeling Language (SysML) editors
    * `jupyter` - Installer for a SysML language kernel for Jupyter, with JupyterLab integration 
      (for more information on Jupyter, see [https://jupyter.org/](https://jupyter.org/))
  * Model projects (KerMl and SysML textual notation)
      * `kerml` - Example models in the Kernel Modeling Language (KerML)
      * `sysml` - Example models in the Systems Modeling Language (SysML) v2
      * `sysml.library` - Normative model libraries for both KerML and SysML, textual notation representation
      * `sysml.library.xmi` - Normative model libraries for both KerML and SysML, XMI representation
        * **Note:** These are Eclipse XMI files (`.kermlx` and `.sysmlx` extensions), which is not a fully normative OMG XMI representation. The XMI is exported _without_ derived property values or implied relationships.
  
Additional content can be accessed at the following URLs.

  * Release notes
     * [https://github.com/Systems-Modeling/SysML-v2-Pilot-Implementation/releases](https://github.com/Systems-Modeling/SysML-v2-Pilot-Implementation/releases)
     * [https://github.com/Systems-Modeling/SysML-v2-API-Services/releases](https://github.com/Systems-Modeling/SysML-v2-API-Services/releases)
     * [https://github.com/Systems-Modeling/SysML-v2-API-Cookbook/releases](https://github.com/Systems-Modeling/SysML-v2-API-Cookbook/releases)
  * OpenAPI documentation for the current API implementation.
    * [http://sysml2.intercax.com:9000/docs/](http://sysml2.intercax.com:9000/docs/)
    * This page acts as an API front end to a live prototype repository implementation
  * Prototype SysML v2 visualization tool
    * [https://www.tomsawyer.com/demonstrations/sysml.2.0.demo/](https://www.tomsawyer.com/demonstrations/sysml.2.0.demo/) 
      (you will need to create an account with Tom Sawyer Software to use this demo)
    * Any model in the prototype repository can be visualized
    * Models in Jupyter can be saved to the repository using the `%publish` command 
      (see topic in the SysML v2 Release group for more information)
 
## Licensing

The specification documents are copyrighted by the organizations listed in those documents under the terms given there.

The `Intro to the SysML v2 Language-Textual Notation` presentation is Copyright © 2019-2025 Model Driven Solutions, Inc. </br>
The `Intro to the SysML v2 Language-Graphical Notation` presentation is Copyright © 2021-2023 Sandy Friedenthal. </br>
Both presentations are licensed under the Creative Commons Attribution 4.0  International License. </br>
To view a copy of this license, visit [http://creativecommons.org/licenses/by/4.0/](http://creativecommons.org/licenses/by/4.0/) 
or send a letter to Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.

The Jupyter and Eclipse software and all included KerML and SysML v2 models in this repository are licensed by the respective copyright holders listed below 
under the GNU Lesser General Public License (LGPL) v3.0 (see `LICENSE` and `LICENSE-GPL` files). Licensing for software and models in other
Systems Modeling repositories is as given in those repositories.

Copyright © 2019-2021 California Institute of Technology (Jet Propulsion Laboratory) <br/>
Copyright © 2019-2025 DEKonsult <br/>
Copyright © 2019-2021 IncQuery Labs Ltd. <br/>
Copyright © 2019-2025 Intercax LLC <br/>
Copyright © 2019-2021 Itemis <br/>
Copyright © 2019-2021 Maplesoft (Waterloo Maple, Inc.) <br/>
Copyright © 2019-2025 Mgnite Inc. <br/>
Copyright © 2019-2025 Model Driven Solutions, Inc. <br/>
Copyright © 2019-2025 SAF Consulting <br/>
Copyright © 2022 Siemens AG <br/>
Copyright © 2021-2025 Twingineer LLC
