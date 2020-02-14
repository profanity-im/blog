---
title: "Last Message Correction"
date: 2020-02-14T11:34:38+01:00
authors:
  - jubalh
---

From 10th to 14th February 2020 we had [Hackweek 19](https://hackweek.suse.com/19/projects) at SUSE.
Part of that time I used to finally implement the long (since 2016!) [sought after](https://github.com/profanity-im/profanity/issues/805) Last Message Correction feature, aka [XEP-0308](https://xmpp.org/extensions/xep-0308.html).

See my [Hackweek project](https://hackweek.suse.com/projects/implement-xep-0308-last-message-correction-in-profanity) and the corresponding [pull request](https://github.com/profanity-im/profanity/pull/1267).

## Usage
To enable incoming and outcoing corrections users need to enable it with `/correction on`, see `/help correction` for more details.

Now we write a message to a friend `/msg Martin Hey therr!`.

Ouch! Already a typo.

Let's make this right: `/corr<TAB> <TAB>` will autocomplete to `/correct Hey therr!` which then can easily be fixed and re-send.

![mistake](/static/img/prof-lmc-wrong.png)
![corrected](/static/img/prof-lmc-corrected.png)

## Details
The feature is only available in the development version of Profanity.

We also need to rewrite more of our UI code. We can't yet compare the `from` field of the old and new message until we have done the rewrite because we don't save this in the UI buffer.
So it's possible that someone could take a look at the IDs and "correct" the messages of other people. Keep this in mind if you choose to the enable this feature.
We plan to rewrite the UI soon so we can properly check the messages origin.
