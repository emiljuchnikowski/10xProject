-- migration: add foreign key constraint from flashcards to ai_suggestions
-- purpose: complete the bidirectional relationship between flashcards and ai_suggestions
-- affected tables: flashcards
-- special considerations:
--   - this migration must run after both flashcards and ai_suggestions tables are created
--   - sets accepted_from_suggestion_id to null if the ai_suggestion is deleted

-- add foreign key constraint to flashcards.accepted_from_suggestion_id
alter table flashcards
  add constraint flashcards_accepted_from_suggestion_id_fkey
  foreign key (accepted_from_suggestion_id)
  references ai_suggestions(id)
  on delete set null;

