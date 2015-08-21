# schema
JSON Schema management structure with versioning

#### Path structure:
Symlinks to the latest schemas available are located in the same directory as the versioned schema versions, stripped from the version numbers, and ending in **.json**. Additionally, symlinks to the latest *build*-version of each schema are named with the corresponding **&lt;major&gt;.&lt;minor&gt;.json** name scheme.

Specific schema versions are named as follows: **&lt;major&gt;.&lt;minor&gt;.&lt;build&gt;.json**, using the versioning scheme as described below.

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
  
#### HTTP request path structure:
HTTP requests should use the correct schema path structure (optionally with the **.json** suffix) as follows:

URI:                                           | Points to:           | Description:
-----------------------------------------------|----------------------|-----------------------------------------------
**http://api.npolar.no/_schema/foo/1.2.1**     | *foo-1.2.1.json*     | **older** schema version
**http://api.npolar.no/_schema/foo/1.2.2**     | *foo-1.2.2.json*     | **older** schema version
**http://api.npolar.no/_schema/foo/1.3.0**     | *foo-1.3.0.json*     | **previous** schema version
**http://api.npolar.no/_schema/foo/1.3.1**     | *foo-1.3.1.json*     | **current** schema version
**http://api.npolar.no/_schema/foo/1.2**       | *foo-1.2.2.json*     | **symlink** to **latest 1.2.x** schema version
**http://api.npolar.no/_schema/foo/1.3**       | *foo-1.3.1.json*     | **symlink** to **latest 1.3.x** schema version
**http://api.npolar.no/_schema/foo**           | *foo-1.3.1.json*     | **symlink** to **current** schema version
**http://api.npolar.no/_schema/bar/baz/1.0.0** | *bar/baz-1.0.0.json* | **current** schema version
**http://api.npolar.no/_schema/bar/baz/1.0**   | *bar/baz-1.0.0.json* | **symlink** to **latest 1.0.x** schema version
**http://api.npolar.no/_schema/bar/baz**       | *bar/baz-1.0.0.json* | **symlink** to **current** schema version
**http://api.npolar.no/_schema/bar**           |                      | Schema does not exist

#### Updating symlinks:
Symlinks can automatically be updated by running the **update.sh** script:
```bash
./update.sh
```
