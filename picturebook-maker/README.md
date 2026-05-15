# picturebook-maker Skill Package

This is a self-contained skill for producing illustrated picture books from a story, myth, lesson, or child-facing idea.

## Package Contents

- `SKILL.md` - main workflow and required rules
- `templates/presets.md` - story voice and visual system menu
- `templates/layout_presets.md` - picture-book layout menu and layout rhythm recipes
- `templates/story_brief.md` - intake template
- `templates/page_plan.md` - page-by-page storyboard template
- `templates/character_sheet.md` - protagonist continuity template
- `templates/prompt_templates.md` - image generation prompt templates
- `templates/interaction_gates.md` - required user-confirmation gates
- `templates/qa_checklist.md` - per-page and print QA checklist
- `templates/print_manifest.md` - expected output manifest
- `references/illustrators/*.md` - distilled illustrator visual personas
- `scripts/compose_picturebook_page.py` - compose text onto a page image
- `scripts/compose_picturebook_cover.py` - compose title/subtitle onto a cover image
- `scripts/build_print_package.py` - build PDFs, contact sheet, and package zip from page PNGs

## Install

Copy the entire `picturebook-maker` folder into a skills directory:

```text
~/.codex/skills/picturebook-maker
```

The folder is self-contained. Do not copy only `SKILL.md`; the templates and references are part of the skill.

## Core Rule

Generate illustrations without long text, then compose Chinese text locally with stable fonts.

## Interaction Rule

The skill is interactive by default:

1. confirm story question
2. confirm story voice
3. confirm visual system
4. confirm layout rhythm
5. confirm page plan
6. confirm character sheet
7. approve each page before continuing
8. confirm cover
9. confirm contact sheet before final print package

Only skip these gates when the user explicitly asks for full automation.
