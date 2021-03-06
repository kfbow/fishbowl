
CREATE OR REPLACE FUNCTION insert_initial_rounds_for_new_game() RETURNS TRIGGER AS
  $$
  BEGIN
    INSERT INTO rounds (game_id, value, order_sequence) VALUES (NEW.id, 'taboo', 0), (NEW.id, 'charades', 1), (NEW.id, 'password', 2);
    RETURN NULL;
  END;
  $$ LANGUAGE PLPGSQL;

CREATE TRIGGER insert_initial_rounds_for_new_game
  AFTER INSERT ON games
  FOR EACH ROW
  EXECUTE PROCEDURE insert_initial_rounds_for_new_game();