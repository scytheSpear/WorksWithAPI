package API;

import entity.Twitter;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class Analyse {

    // used to store positive and negative words for scoring
    static List<String> posWords = new ArrayList<String>();
    static List<String> negWords = new ArrayList<String>();
    int[] stats = new int[5];

    public int[] analisy(String qu) throws IOException {

        // source: www.cs.uic.edu/~liub/FBS/sentiment-analysis.html
        BufferedReader negReader = new BufferedReader(new FileReader(new File(
                "C:\\Users\\user\\Documents\\NetBeansProjects\\FIT5046A1C\\src/negative-words.txt")));
        BufferedReader posReader = new BufferedReader(new FileReader(new File(
                "C:\\Users\\user\\Documents\\NetBeansProjects\\FIT5046A1C\\src/positive-words.txt")));

        // currently read word
        String word;

        // add words to comparison list
        while ((word = negReader.readLine()) != null) {
            negWords.add(word);
        }
        while ((word = posReader.readLine()) != null) {
            posWords.add(word);
        }
        negReader.close();
        posReader.close();

        // current score
        int score = 0;

        try {
            TwitterCaller t = new TwitterCaller();
            List<Twitter> tweets = t.TwitterResponse(qu);

            for (Twitter tweet : tweets) {

                stats[4]++;

                if (tweet.getMetadata().getIso_language_code().equals("en") == false) {
                    stats[3]++;
                    score = 0;
                } else {
                    String s = tweet.getText();
                    //score = getSentimentScore(tweet.get("text"));
                    score = getSentimentScore(s);
                    // ++ index so we won't have -1 and stuff...
                    stats[score + 1]++;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return stats;
    }

    public List<Twitter> getPosTweets(String qu) throws IOException {

        List<Twitter> tw = new ArrayList<>();
        BufferedReader negReader = new BufferedReader(new FileReader(new File(
                "C:\\Users\\user\\Documents\\NetBeansProjects\\FIT5046A1C\\src/negative-words.txt")));
        BufferedReader posReader = new BufferedReader(new FileReader(new File(
                "C:\\Users\\user\\Documents\\NetBeansProjects\\FIT5046A1C\\src/positive-words.txt")));
        String word;

        while ((word = negReader.readLine()) != null) {
            negWords.add(word);
        }
        while ((word = posReader.readLine()) != null) {
            posWords.add(word);
        }
        negReader.close();
        posReader.close();

        int score = 0;

        try {
            TwitterCaller t = new TwitterCaller();
            List<Twitter> tweets = t.TwitterResponse(qu);
            for (Twitter tweet : tweets) {
                if (tweet.getMetadata().getIso_language_code().equals("en") == true) {

                    String s = tweet.getText();
                    score = getSentimentScore(s);
                    if (score == 1) {
                        tw.add(tweet);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tw;
    }

    public List<Twitter> getNegTweets(String qu) throws IOException {
        List<Twitter> tw = new ArrayList<>();
        // source: www.cs.uic.edu/~liub/FBS/sentiment-analysis.html
        BufferedReader negReader = new BufferedReader(new FileReader(new File(
                "C:\\Users\\user\\Documents\\NetBeansProjects\\FIT5046A1C\\src/negative-words.txt")));
        BufferedReader posReader = new BufferedReader(new FileReader(new File(
                "C:\\Users\\user\\Documents\\NetBeansProjects\\FIT5046A1C\\src/positive-words.txt")));

        // currently read word
        String word;

        // add words to comparison list
        while ((word = negReader.readLine()) != null) {
            negWords.add(word);
        }
        while ((word = posReader.readLine()) != null) {
            posWords.add(word);
        }
        negReader.close();
        posReader.close();

        // current score
        int score = 0;

        try {
            TwitterCaller t = new TwitterCaller();
            List<Twitter> tweets = t.TwitterResponse(qu);

            for (Twitter tweet : tweets) {

                if (tweet.getMetadata().getIso_language_code().equals("en") == false) {
                    score = 0;
                } else {
                    String s = tweet.getText();
                    score = getSentimentScore(s);
                    if (score == -1) {
                        tw.add(tweet);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tw;
    }

    /**
     * does some string mangling and then calculates occurrences in positive /
     * negative word list and finally the delta
     *
     *
     * @param input String: the text to classify
     * @return score int: if < 0 then -1, if > 0 then 1 otherwise 0 - we don't
     * care about the actual delta
     */
    private static int getSentimentScore(String input) {
        // normalize
        input = input.toLowerCase();
        input = input.trim();
        // remove all non alpha-numeric non whitespace chars
        input = input.replaceAll("[^a-zA-Z0-9\\s]", "");

        int negCounter = 0;
        int posCounter = 0;

        String[] words = input.split(" ");

        // check if the current word appears in reference lists
        for (int i = 0; i < words.length; i++) {
            if (posWords.contains(words[i])) {
                posCounter++;
            }
            if (negWords.contains(words[i])) {
                negCounter++;
            }
        }
        // positive matches MINUS negative matches
        int result = (posCounter - negCounter);
        // negative
        if (result < 0) {
            return -1;
            //  positive
        } else if (result > 0) {
            return 1;
        }
        // neutral 
        return 0;
    }
}
