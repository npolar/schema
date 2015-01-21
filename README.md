# schema
Proposal for new (JSON) schema management with versioning

#### Path structure:
Symlinks to the newest schemas available are located in the root of each directory, using the same name as the correct directory, ending in **.json**. Specific versions of schemas are located in schema-separated sub-directories, named as follows: **&lt;major&gt;.&lt;minor&gt;.json**, using the correct versioning scheme as described below.

#### Versioning scheme:
* **Major** - Increased for *breaking* changes in the schema, such as:
  * Removal/renaming of keys
  * Change of types
  * Change of schema references
* **Minor** - Increased for *non*-breaking changes in the schema, such as:
  * Added fields (e.g. keys, descriptions, titles etc.)
  * Added enum options
  * Change of string formats
  * Change of number ranges
