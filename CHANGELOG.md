0.9.4 (03/20/2019)
------------------

* allow deploying the same image to multiple services and make task vs service auto detected [9f841d7](https://github.com/simplygenius/atmos/commit/9f841d7)
* fix link [deba98f](https://github.com/simplygenius/atmos/commit/deba98f)

0.9.3 (02/12/2019)
------------------

* add the ability to use a prefix for scoping secrets [470556a](https://github.com/simplygenius/atmos/commit/470556a)
* add comment [b0592d5](https://github.com/simplygenius/atmos/commit/b0592d5)
* fix pro recipe source url [9ddb8a8](https://github.com/simplygenius/atmos/commit/9ddb8a8)
* handle flushing of data in plugin output handlers when streaming completes [e1e4707](https://github.com/simplygenius/atmos/commit/e1e4707)
* refactor secrets config into a more general user config file in users home directory [06875b7](https://github.com/simplygenius/atmos/commit/06875b7)
* expand warnings for missing aws auth [3ad6ec0](https://github.com/simplygenius/atmos/commit/3ad6ec0)

0.9.2 (12/01/2018)
------------------

* add more useful display of type mismatches during config merges [b751a82](https://github.com/simplygenius/atmos/commit/b751a82)
* ensure all config files are hash like [5ad14fb](https://github.com/simplygenius/atmos/commit/5ad14fb)

0.9.1 (11/30/2018)
------------------

* fix some json weirdness with ruby v2.3 vs 2.5 and active support [82c02d1](https://github.com/simplygenius/atmos/commit/82c02d1)
* docker tweaks [f44c9b1](https://github.com/simplygenius/atmos/commit/f44c9b1)
* warn instead of trace for empty recipe config [7c83238](https://github.com/simplygenius/atmos/commit/7c83238)
* fix docker based runtime, pass through more mounts and skip aws cli based auth lookup as it slowed things down too much [f9844e9](https://github.com/simplygenius/atmos/commit/f9844e9)

0.9.0 (10/18/2018)
------------------

* change terraform plugin sharing to do so by copying the plugins to the home directory location that is searched by terraform . [9779685](https://github.com/simplygenius/atmos/commit/9779685)
* fix comment [58e51a1](https://github.com/simplygenius/atmos/commit/58e51a1)
* handle empty config files [8f48c98](https://github.com/simplygenius/atmos/commit/8f48c98)
* push working group up to main cli and add to atmos config so that we can reference it in backend state key [ca87c24](https://github.com/simplygenius/atmos/commit/ca87c24)
* move all but config location to atmos runtime config [3f86a3e](https://github.com/simplygenius/atmos/commit/3f86a3e)
* fix dev tools [1edf4e2](https://github.com/simplygenius/atmos/commit/1edf4e2)
* version constrain all the dependencies [cdce71f](https://github.com/simplygenius/atmos/commit/cdce71f)
* make explicit the use of working_group for state key by passing in atmos_working_group as a terraform variable [83a581f](https://github.com/simplygenius/atmos/commit/83a581f)
* move atmos vars in yml into their own namespace [705beda](https://github.com/simplygenius/atmos/commit/705beda)
* force hashie version [e52cd93](https://github.com/simplygenius/atmos/commit/e52cd93)
* fix to work with ruby 2.3 [b2612ec](https://github.com/simplygenius/atmos/commit/b2612ec)
* log load path [3b4945d](https://github.com/simplygenius/atmos/commit/3b4945d)
* add ability to add to ruby load path from cli/config [e13935b](https://github.com/simplygenius/atmos/commit/e13935b)
* allow templates to directly reference scoped context with method_missing (lets skip assigning a var when asking questions) [8cf203e](https://github.com/simplygenius/atmos/commit/8cf203e)
* fix doc strinng [7257229](https://github.com/simplygenius/atmos/commit/7257229)
* add choose to ui in templates [efb7047](https://github.com/simplygenius/atmos/commit/efb7047)
* add update to generator to allow applying all previously installed templates [2faa6e9](https://github.com/simplygenius/atmos/commit/2faa6e9)
* make state file be plain yaml (no atmos class refs) [625d508](https://github.com/simplygenius/atmos/commit/625d508)
* allow disabling built in sourcepaths from cli [64a2c18](https://github.com/simplygenius/atmos/commit/64a2c18)
* refactor loading of env/providers so they can be in a dedicated file [fedf915](https://github.com/simplygenius/atmos/commit/fedf915)
* extract recipes to own yml [518e1b7](https://github.com/simplygenius/atmos/commit/518e1b7)
* plugin config tweaks [3cbc19e](https://github.com/simplygenius/atmos/commit/3cbc19e)
* allow custom config sources [9d82d09](https://github.com/simplygenius/atmos/commit/9d82d09)
* refactor template/context/hash mess into template class, fix a number of issues with context, disallow duplicate template names for now, add initial state tracking [e00a4dc](https://github.com/simplygenius/atmos/commit/e00a4dc)
* add context, allow UI to get answers from context, fix dependency traversal to handle context [43584d3](https://github.com/simplygenius/atmos/commit/43584d3)
* cleanup plugins, allow per-plugin config [89c9f96](https://github.com/simplygenius/atmos/commit/89c9f96)
* handle inline as an option to notify [de7afff](https://github.com/simplygenius/atmos/commit/de7afff)
* remove debug [463ad0d](https://github.com/simplygenius/atmos/commit/463ad0d)
* fix sourcepath directory expansion [e41304c](https://github.com/simplygenius/atmos/commit/e41304c)
* rework generators to allow disambiguation template name duplication across sources, and to prepare for saving a list of all installed templates and fully qualifying templates names by source [b06fa68](https://github.com/simplygenius/atmos/commit/b06fa68)
* separate plugin loading from initialization [e0801d0](https://github.com/simplygenius/atmos/commit/e0801d0)
* add in simplygenius to namespace, refactor to handle namespacing better (Module.nesting) across code/tests [168af71](https://github.com/simplygenius/atmos/commit/168af71)
* update pro release sources [454b054](https://github.com/simplygenius/atmos/commit/454b054)
* helper for local plugin dev [1479604](https://github.com/simplygenius/atmos/commit/1479604)
* add basic plugin mechanism and refactor terraform output filtering as a plugin [29e32a3](https://github.com/simplygenius/atmos/commit/29e32a3)
* add passthrough to highline choose for menus [d9cda18](https://github.com/simplygenius/atmos/commit/d9cda18)
* write auth cache when auto renewing session [bc2f8f9](https://github.com/simplygenius/atmos/commit/bc2f8f9)
* handle interrupts [f8db090](https://github.com/simplygenius/atmos/commit/f8db090)
* try to fix travis error [cceaf43](https://github.com/simplygenius/atmos/commit/cceaf43)
* newer bundler [eaffeba](https://github.com/simplygenius/atmos/commit/eaffeba)
* fix test [030d8c4](https://github.com/simplygenius/atmos/commit/030d8c4)
* version update [0257e0c](https://github.com/simplygenius/atmos/commit/0257e0c)
* use eq [8e7eccc](https://github.com/simplygenius/atmos/commit/8e7eccc)
* show exe output on fail [e2fecf4](https://github.com/simplygenius/atmos/commit/e2fecf4)
* fix/add tests for username in assume role session [5ff99ff](https://github.com/simplygenius/atmos/commit/5ff99ff)
* add username to assume role session name for easier tracking, e.g. in cloudtrail [585a974](https://github.com/simplygenius/atmos/commit/585a974)
* added custom merge logic that works better and removes hacks [d668dd9](https://github.com/simplygenius/atmos/commit/d668dd9)
* fix homogenize of atmos_config, and don't homogenize yaml that gets directly added so that yml can be used to set values for maps/list for declared vars [7e1c221](https://github.com/simplygenius/atmos/commit/7e1c221)
* do an additive merge of lists in config as its more useable in the average case of adding to a default [d9d654d](https://github.com/simplygenius/atmos/commit/d9d654d)
* test more ruby versions [8733d46](https://github.com/simplygenius/atmos/commit/8733d46)
* fix permalink to atmos-pro [c0e6a57](https://github.com/simplygenius/atmos/commit/c0e6a57)
* readme tweaks [16db27a](https://github.com/simplygenius/atmos/commit/16db27a)
* helper for tagging recipe repos when releasing [9632bee](https://github.com/simplygenius/atmos/commit/9632bee)

0.7.1 (05/03/2018)
------------------

* version lock recipe sources by default [e88d027](https://github.com/simplygenius/atmos/commit/e88d027)
* test zip archive over http [e7c51db](https://github.com/simplygenius/atmos/commit/e7c51db)
* add an architecture picture to readme [83377da](https://github.com/simplygenius/atmos/commit/83377da)
* add condensed screencast [a58633e](https://github.com/simplygenius/atmos/commit/a58633e)
* lookup and pass aws keys to docker [b5d0240](https://github.com/simplygenius/atmos/commit/b5d0240)
* allow rubygems push [2dd2c9b](https://github.com/simplygenius/atmos/commit/2dd2c9b)

0.7.0 (04/11/2018)
------------------

* First public release
