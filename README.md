# schema
Proposal for new (JSON) schema management with versioning

#### Path structure:
Symlinks to the latest schemas available are located in the root of each directory, using the same name as the correct directory, ending in **.json**.
Additionally, symlinks to the latest *build*-version of each schema are named with the corresponding **&lt;major&gt;.&lt;minor&gt;.json** name scheme.

Specific versions of schemas are located in schema-separated sub-directories, named as follows:<br/>
**&lt;major&gt;.&lt;minor&gt;.&lt;build&gt;.json**, using the correct versioning scheme as described below.

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

#### Proposed HTTP request paths:
HTTP requests should use the correct schema path structure, without the **.json** suffix, as follows:

URI:                                   | Points to:                  | Description:
---------------------------------------|-----------------------------|-----------------------------------------------
**http://schema.domain/foo/1.2.1**     | *schema/foo/1.2.1.json*     | **older** schema version
**http://schema.domain/foo/1.2.2**     | *schema/foo/1.2.2.json*     | **older** schema version
**http://schema.domain/foo/1.3.0**     | *schema/foo/1.3.0.json*     | **previous** schema version
**http://schema.domain/foo/1.3.1**     | *schema/foo/1.3.1.json*     | **current** schema version
**http://schema.domain/foo/1.2**       | *schema/foo/1.2.2.json*     | **symlink** to **latest 1.2.x** schema version
**http://schema.domain/foo/1.3**       | *schema/foo/1.3.1.json*     | **symlink** to **latest 1.3.x** schema version
**http://schema.domain/foo**           | *schema/foo/1.3.1.json*     | **symlink** to **current** schema version
**http://schema.domain/bar/baz/1.0.0** | *schema/bar/baz/1.0.0.json* | **current** schema version
**http://schema.domain/bar/baz/1.0**   | *schema/bar/baz/1.0.0.json* | **symlink** to **latest 1.0.x** schema version
**http://schema.domain/bar/baz**       | *schema/bar/baz/1.0.0.json* | **symlink** to **current** schema version
**http://schema.domain/bar**           |                             | Schema does not exist

#### Alternate path structure:
This alternate proposal keeps all schema versions on the root directory, maintaining schema names in file names:

URI:                                   | Points to:                  | Description:
---------------------------------------|-----------------------------|-----------------------------------------------
**http://schema.domain/foo/1.2.1**     | *schema/foo-1.2.1.json*     | **older** schema version
**http://schema.domain/foo/1.2.2**     | *schema/foo-1.2.2.json*     | **older** schema version
**http://schema.domain/foo/1.3.0**     | *schema/foo-1.3.0.json*     | **previous** schema version
**http://schema.domain/foo/1.3.1**     | *schema/foo-1.3.1.json*     | **current** schema version
**http://schema.domain/foo/1.2**       | *schema/foo-1.2.2.json*     | **symlink** to **latest 1.2.x** schema version
**http://schema.domain/foo/1.3**       | *schema/foo-1.3.1.json*     | **symlink** to **latest 1.3.x** schema version
**http://schema.domain/foo**           | *schema/foo-1.3.1.json*     | **symlink** to **current** schema version
**http://schema.domain/bar/baz/1.0.0** | *schema/bar/baz-1.0.0.json* | **current** schema version
**http://schema.domain/bar/baz/1.0**   | *schema/bar/baz-1.0.0.json* | **symlink** to **latest 1.0.x** schema version
**http://schema.domain/bar/baz**       | *schema/bar/baz-1.0.0.json* | **symlink** to **current** schema version
**http://schema.domain/bar**           |                             | Schema does not exist

#### Updating symlinks:
Symlinks can automatically be updated by running the **update.sh** script:
```bash
sh update.sh
```
