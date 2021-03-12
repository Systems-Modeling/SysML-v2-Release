# SysML v2 Release Eclipse Installation

**Requirements:** Eclipse 2020-06 (4.16) or later, with Java Development Kit

## Installing the plugins

1. Open an Eclipse workspace.

2. Select `Help > Install New Software`.

3. Select `Add...` and then, in the add dialog, select `Archive...` .

4. Navigate to the `org.omg.sysml.site.zip` archive and select it. (You can give it a name if you wish.) Click `Add`.

5. In the Install window, expand the `KerML and SysML Editors` category.

6. Select `SysML v2 Feature` and click `Next`.
   * If you also wish to install the `SysML v2 PlantUML Feature`, please first follow the instructions below under <br/> "Installing PlantUML graphical visualization".

7. Continue with the installation (select `Install Anyway` if asked), and, when it is complete, restart Eclipse.

## Installing PlantUML graphical visualization

Graphical visualization is available in Eclipse using the open source [PlantUML](https://plantuml.com) tooling to render diagrams.

0. Make sure that your Eclipse has PlantUML with SysMLv2 extensions. You can install it from the update site of<br/> 
[ https://github.com/himi/p2-update-puml-sysmlv2/raw/main/updates](https://github.com/himi/p2-update-puml-sysmlv2/raw/main/updates) with Help > Install New Software

1. PlantUML visualization requires that [GraphViz](https://www.graphviz.org) be installed.Visit [ https://www.graphviz.org/download/](https://www.graphviz.org/download/) and <br/>
download the appropriate package for your environment.
   * The recommended GraphViz version is 2.44.1.  Make sure you have initialized GraphViz with `dot -c` command. <br/>
   See [ https://plantuml.com/ja/graphviz-dot](https://plantuml.com/ja/graphviz-dot) for details.

2. If Eclipse cannot automatically find the path to the GraphViz executable, you can set it by going to `Preferences > PlantUML`. <br/>
For details, visit [ https://plantuml.com/en/eclipse](https://plantuml.com/en/eclipse).

## Installing the model library and modeling projects

**Note:** If you are updating an existing installation of an earlier SysML v2 release, then, before proceeding with the procedure
below, delete the `kerml`, `sysml` and `sysml.library` projects from your workspace, selecting `Delete project contents from disk`.

1. Select `File > Import`.

2. Under `General`, choose `Existing Projects into Workspace`.

3. Browse to the `sysml.library` directory and select it.

4. Under `Projects`, select `sysml.library`, under `Options` select `Copy projects into workspace`, then click `Finish`.

5. Turn off `Project > Build Automatically`, then select `Project > Clean...` and build *only* `sysml.library`.

6. Repeat the above steps for the `kerml` and `sysml` projects.

**Important Note:** Import the `kerml` and `sysml` projects *only* after importing and building the `sysml.library` project.

After installation is complete, if you wish to turn `Build Automatically` back on, first go to `Preferences > General > Workspace > Build`
and make sure that `sysml.library` is before `kerml` and `sysml` in the build order.

## Working with model files

1. Double click on a file with a `.kerml` or `.sysml` extension to view it in a Kernel Modeling Language (KerML) or Systems Modeling Language (SysML).
 
2. Create new KerML files in the `kerml/src` directory with the extension `.kerml`.

2. Create new SysML files in the `sysml/src` directory with the extension `.sysml`.

3. You can view the model library files in the `sysml.library` project, but *do not change them*.
   
4. To show SysML diagrams, in `Window > Show View > Other...` select the PlantUML view. The diagram rendered in the view is relative to the text selected 
in the active SysML editor view. Tree (BDD-like), interconnection (IBD-like) and state machine views are currently supported.

## Initializing new model projects

You can also create a separate project for your KerML or SysML files.

1. Select `File > New > Project...` to open the New Project wizard.

2. Select `General/Project`.

3. Enter the project name (and location if necessary), then press Next.

4. On the Project References page, check the `sysml.library` project. This step tells Eclipse which other projects should be visible for resolving cross-references.

5. Right-click the new project and select `Configure > Convert` to an Xtext project. This step sets up the indexing infrastructure necessary for resolving references between different files.

6. Create any text files with `.kerml` or `.sysml` extensions to start working with a new file.  

**Note:** Adding the project references to an existing project can be done in the project Properties dialog available from the popup menu on the project in the Project References page.

**Note:** If the Xtext setup (step 5) is missed, opening the KerML or SysML editor shows a dialog asking to convert the project to an Xtext project. 
Accepting this has the same results as manually selecting the menu item on the project. 