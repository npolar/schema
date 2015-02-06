# schema
Proposal for new (JSON) schema management with versioning

#### Path structure:
Symlinks to the latest schemas available are located in the root of each directory, using the same name as the correct directory, ending in **.json**.
Additionally, symlinks to the latest *build*-version of each schema are named with the corresponding **&lt;major&gt;.&lt;minor&gt;.json** name scheme.
Specific versions of schemas are located in schema-separated sub-directories, named as follows: **&lt;major&gt;.&lt;minor&gt;.&lt;build&gt;.json**,
using the correct versioning scheme as described below.

#### Versioning scheme:
* **Major** - Increased for *breaking* changes in the schema, such as:
  * Removal/renaming of key/value pairs
  * Addition of *required* key/value pairs
  * Change of types (objects, arrays, strings etc.)
  * Change of schema references (i.e. $ref)
* **Minor** - Increased for *non*-breaking changes in the schema, such as:
  * Addition of *non*-required key/value pairs
  * Addition of meta-fields (e.g. descriptions, titles etc.)
  * Addedion of enum options
  * Change of string formats **(with caution)**
  * Change of number ranges **(with caution)**
* **Build** - Increased for *non*-breaking adjustments in the schema, such as:
  * Typo fixes in meta-fields
  * Indentation clean-up

#### Updating symlinks:
Symlinks can automatically be updated by running the **update.sh** script:
```bash
sh update.sh
```