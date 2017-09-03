# auto-release

This is a proof of concept Ember application that:
- Uses [GitHub Flow](https://help.github.com/articles/github-flow/)
- Requires a versioned release
- Requires a [Changelog](http://keepachangelog.com/en/1.0.0/)

## Flow
- Developer branches `master`
- Commits against branch
- Issues Pull Request
- CI builds and runs tests
- Pull Request is squashed, merged to `master`
- CI builds `master`
- CI updates `package.json` and `CHANGELOG.md` automatically
- CI pushes release to `master`

## Software
- [ember-cli-release](https://github.com/lytics/ember-cli-release)
- [auto-changelog](https://github.com/CookPete/auto-changelog)
- [Travis CI](https://travis-ci.org/)

## Notes
- Travis is set to build `master`
  - `ember-cli-release` ultimately commits to `master`, so the message must contain `[skip ci]`
- Tag must happen first so `auto-changelog` renders as expected
- `ember-cli-release` executes the auto-changelog command
  - otherwise we would have two commits for every release
  - 1 commit for `package.json`
  - 1 commit for `changelog.md`
  - this results in a redundant changelog entry
- changelog entries are the squash merge title
