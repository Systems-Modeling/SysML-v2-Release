# OMG System Modeling Language™ (SysML®) v2 Release

The [SysML v2 Release](https://github.com/Systems-Modeling/SysML-v2-Release) repository contains the latest incremental release of the SysML v2 specification documents, 
example models and model library. It also provides instructions for user installation of SysML v2 Pilot Implementation editors. For developer installs, please see the
development repositories also available from the [Systems Modeling](https://github.com/Systems-Modeling) organization on GitHub.

## Team

The SysML v2 Submission Team (SST) is a joint team of over 160 individuals from over 70 industry, academia and government organizations, 
working together to develop the next major version of the Object Management Group (OMG) System Modeling Language (SysML). 
The goal is to deliver a SysML v2 specification that is validated by the user community, that is demonstrable with a pilot implementation 
and that provides a smooth migration path for SysML v1 users and models.

The proposed SysML v2 specification will be submitted to the OMG in response to two Requests for Proposals (RFPs), which are publicly available at [http://www.omg.org](http://www.omg.org):

   * [Systems Modeling Language (SysML) v2 RFP (ad/2017-12-02)](http://doc.omg.org/ad/2017-12-2)
   * [Systems Modeling Language (SysML) v2 API and Services RFP (ad/2018-06-03)](http://doc.omg.org/ad/2018-6-3)

## Feedback

To ask questions about using this release or to provide feedback, join the SysML v2 Release Google Group.

   * Go to [https://groups.google.com/forum/#!forum/sysml-v2-release](https://groups.google.com/forum/#!forum/sysml-v2-release) while logged into a Google account. Select “Apply for Membership”. <br/>
     Please provide your full name, organizational affiliation and interest in SysML.
   * Once your application has been accepted, you can post to the group using the email 
     [sysml-v2-release@googlegroups.com](mailto:sysml-v2-release@googlegroups.com). 
 
## Release Content

The release repository contains the items listed below. For a Zip archive of the entire repository contents, go to 
[https://github.com/Systems-Modeling/SysML-v2-Release/releases](https://github.com/Systems-Modeling/SysML-v2-Release/releases) and download the appropriate version.

  * In the `doc` directory.
    * Introductory presentation on the SysML v2 textual notation
        * `Intro to the SysML v2 Language.pdf`
    * SysML v2 specification documents (PDF)
        1. Kernel Modeling Language (KerML), version 1.0
        2. OMG Systems Modeling Language (SysML), version 2.0
        3. Systems Modeling Application Programming Interface (API) and Services, version 1.0
  * In the `install` directory
    * `eclipse` - Installer for Eclipse plugins for Kernel Modeling Language (KerML) and System Modeling Language (SysML) editors
    * `jupyter` - Installer for a SysML language kernel for Jupyter, with JupyterLab integration 
      (for more information on Jupyter, see [https://jupyter.org/](https://jupyter.org/))
  * SysML v2 model projects (textual notation)
      * `kerml` - Example models in the Kernel Modeling Language (KerML)
      * `sysml` - Example models in the Systems Modeling Language (SysML) v2
      * `sysml.library` - Normative model libraries for both KerML and SysML
  
Additional content can be accessed at the following URLs.

  * Release notes
     * [https://github.com/Systems-Modeling/SysML-v2-Pilot-Implementation/releases](https://github.com/Systems-Modeling/SysML-v2-Pilot-Implementation/releases)
     * [https://github.com/Systems-Modeling/SysML-v2-API-Services/releases](https://github.com/Systems-Modeling/SysML-v2-API-Services/releases)
  * OpenAPI/Swagger documentation for the current API implementation.
    * [http://sysml2.intercax.com:9000/docs/](http://sysml2.intercax.com:9000/docs/)
    * This page acts as an API front end to a live prototype repository implementation
  * Prototype SysML v2 visualization tool
    * [https://www.tomsawyer.com/demonstrations/sysml.2.0.demo/](https://www.tomsawyer.com/demonstrations/sysml.2.0.demo/) 
      (you will need to create an account with Tom Sawyer Software to use this demo)
    * Any model in the prototype repository can be visualized
    * Models in Jupyter can be saved to the repository using the `%publish` command 
      (see topic in the SysML v2 Release group for more information)
 
## Licensing

The specification documents are copyrighted by the SST member organizations listed in those documents under the terms given there.

The `Intro to the SysML v2 Language` presentation is Copyright © 2019-2021 Model Driven Solutions, Inc., and licensed under the Creative Commons Attribution 4.0 
International License. To view a copy of this license, visit [http://creativecommons.org/licenses/by/4.0/](http://creativecommons.org/licenses/by/4.0/) 
or send a letter to Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.

The Jupyter and Eclipse software and all included SysML v2 models are licensed by the respective copyright holders listed below 
under the GNU Lesser General Public License (LGPL) v3.0 (see `LICENSE` and `LICENSE-GPL` files).

Copyright © 2019-2021 California Institute of Technology (Jet Propulsion Laboratory) <br/>
Copyright © 2019-2021 DEKonsult <br/>
Copyright © 2019-2021 IncQuery Labs Ltd. <br/>
Copyright © 2019-2021 Itemis <br/>
Copyright © 2019-2021 Maplesoft (Waterloo Maple, Inc.) <br/>
Copyright © 2019-2021 Mgnite Inc. <br/>
Copyright © 2019-2021 Model Driven Solutions, Inc. <br/>
Copyright © 2019-2021 SAF Consulting
