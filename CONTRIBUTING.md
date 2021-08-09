Release Process
===============

* Upgrade gems with `scripts/update-gemspec`
* Bump the version number in `lib/cucumber/wire/version`
* Update `CHANGELOG.md` with the upcoming version number and create a new `Unreleased` section
* Remove empty sections from `CHANGELOG.md`
* Now release it:

```
git commit -am "Release X.Y.Z"
git push
```

This will trigger the [`pre-release`](.github/workflows/pre-release.yml) workflow which creates a PR
to a `release/*` branch.

Once a member of the [@cucumber/cucumber-ruby](https://github.com/orgs/cucumber/teams/cucumber-ruby) core team has approved the release by merging the PR, the new version of the gem will be released automatically
by the [`release`](.github/workflows/release.yml) workflow.
