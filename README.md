# OTT_PLATFROM
package Java_topic;
import DS_topic.BST;

import java.io.*;
import java.sql.*;
import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.*;

public class OTT_PLATFORM extends Main {

    static Scanner sc = new Scanner(System.in);

    public static void main(String[] args) throws SQLException, InterruptedException {
        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ott", "root", "");

            System.out.println((con != null) ? ConsoleColors.GREEN_BOLD + "✓ Database Connection Successful!" + ConsoleColors.RESET : ConsoleColors.RED_BOLD + "✗ Database Connection Failed!" + ConsoleColors.RESET);
            HashMap<Long, user> hm = new HashMap<>();
            HashMap<Long, Admin> hmu = new HashMap<>();
            OTT_PLATFORM ott = new OTT_PLATFORM();
            ott.initSchema(con);
            ott.runMenuLoop(con, hm, hmu, ott);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    } // Implement abstract: initSchema (your CREATE TABLE section)
    protected void initSchema(Connection con) throws SQLException {
        Statement st = con.createStatement();
        st.executeUpdate("CREATE TABLE IF NOT EXISTS admin ( admin_id BIGINT(100) PRIMARY KEY, admin_name VARCHAR(10), admin_email VARCHAR(20), admin_password VARCHAR(15))");
        st.executeUpdate("CREATE TABLE IF NOT EXISTS episode (episodeID INT(10) AUTO_INCREMENT PRIMARY KEY, seriesID INT(10), title VARCHAR(30), episodeNO INT(10), video_path LONGTEXT, duration VARCHAR(30))");
        st.executeUpdate("CREATE TABLE IF NOT EXISTS history ( his_ID INT(10) PRIMARY KEY AUTO_INCREMENT, time VARCHAR(30), user_id BIGINT(20), date DATE, content_name VARCHAR(50))");
        st.executeUpdate("CREATE TABLE IF NOT EXISTS login(loginID INT(10) PRIMARY KEY AUTO_INCREMENT,userID INT(10) )");
        st.executeUpdate("CREATE TABLE IF NOT EXISTS movie ( movie_id INT(10) PRIMARY KEY AUTO_INCREMENT, movie_title VARCHAR(50), movie_language VARCHAR(10), category VARCHAR(10), video_path VARCHAR(30), duration VARCHAR(10), lik INT DEFAULT 0)");
        st.executeUpdate("CREATE TABLE IF NOT EXISTS review( reviewID INT(10) AUTO_INCREMENT PRIMARY KEY, userID INT(10), content VARCHAR(30), rating INT(10), date DATE)");
        st.executeUpdate("CREATE TABLE IF NOT EXISTS series (id INT(11) AUTO_INCREMENT PRIMARY KEY, title VARCHAR(50), season INT, episodeNO INT, episode_name VARCHAR(50), duration VARCHAR(20), lik INT DEFAULT 0)");
        st.executeUpdate("CREATE TABLE IF NOT EXISTS Subscription_plan ( Subscription_id INT(11) AUTO_INCREMENT PRIMARY KEY, type VARCHAR(30), Start_date DATE, end_date DATE, user_id BIGINT(20))");
        st.executeUpdate("CREATE TABLE IF NOT EXISTS user ( user_id BIGINT PRIMARY KEY, first_name VARCHAR(20), middle_name VARCHAR(20), last_name VARCHAR(20), email VARCHAR(50), password VARCHAR(20), mobile_no BIGINT(20), age INT, subscription VARCHAR(10))");
    }


    protected void runMenuLoop(Connection con, HashMap<Long, user> hm, HashMap<Long, Admin> hmu, OTT_PLATFORM ott) throws SQLException, InterruptedException {

        while (true) {
            System.out.println(ConsoleColors.CYAN_BOLD +   "╔════════════════════════════════════════╗" + ConsoleColors.RESET);
            System.out.println(ConsoleColors.CYAN_BOLD +   "║          Welcome to OTT PLATFORM       ║" + ConsoleColors.RESET);
            System.out.println(ConsoleColors.CYAN_BOLD +   "╚════════════════════════════════════════╝" + ConsoleColors.RESET);
            System.out.println(ConsoleColors.YELLOW_BOLD + "🎬 Choose Your Option:" + ConsoleColors.RESET);
            System.out.println(ConsoleColors.WHITE_BOLD + " 1️⃣  User Login/Signup" + ConsoleColors.RESET);
            System.out.println(ConsoleColors.WHITE_BOLD + " 2️⃣  Admin Login/Signup" + ConsoleColors.RESET);
            System.out.println(ConsoleColors.WHITE_BOLD + " 3️⃣  Exit Application" + ConsoleColors.RESET);
            int choice = readIntInRange(sc, ConsoleColors.CYAN_BOLD + "➤ Enter your choice: " + ConsoleColors.RESET, 1, 3);


            if (choice == 3) {
                System.out.println(ConsoleColors.GREEN_BOLD + "👋 Thank you for using OTT PLATFORM! Goodbye!" + ConsoleColors.RESET);
                break;
            }

            if (choice == 1) {
                ott.userlogsign(con, hm);
            } else if (choice == 2) {
                ott.adminlogsign(con, hmu);
            }
        }
    }

    void userlogsign(Connection con, HashMap<Long, user> hm) throws SQLException, InterruptedException {
        try {
            while (true) {
                System.out.println(ConsoleColors.BLUE_BOLD + "╔══════════════════════════════════════════╗" + ConsoleColors.RESET);
                System.out.println(ConsoleColors.BLUE_BOLD + "║              User Portal                 ║" + ConsoleColors.RESET);
                System.out.println(ConsoleColors.BLUE_BOLD + "╚══════════════════════════════════════════╝" + ConsoleColors.RESET);
                System.out.println(ConsoleColors.YELLOW_BOLD + "🔐 Choose Action:" + ConsoleColors.RESET);
                System.out.println(ConsoleColors.WHITE_BOLD + "  1️⃣  Create New Account" + ConsoleColors.RESET);
                System.out.println(ConsoleColors.WHITE_BOLD + "  2️⃣  Login to Account" + ConsoleColors.RESET);
                System.out.println(ConsoleColors.WHITE_BOLD + "  3️⃣  Back to Main Menu" + ConsoleColors.RESET);
                int u_choice = readIntInRange(sc, ConsoleColors.CYAN_BOLD + "➤ Enter your choice: " + ConsoleColors.RESET, 1, 3);

                if (u_choice == 1) {
                    try {
                        System.out.println(ConsoleColors.GREEN_BOLD + "📝 User Registration Form" + ConsoleColors.RESET);
                        System.out.println(ConsoleColors.CYAN_BOLD + "══════════════════════════════════════════" + ConsoleColors.RESET);
                        String f_name = readValidName(sc, ConsoleColors.YELLOW_BOLD + "Enter full name: " + ConsoleColors.RESET);
                        String m_name = readValidName(sc, ConsoleColors.YELLOW_BOLD + "Enter Your Middle Name: " + ConsoleColors.RESET);
                        String l_name = readValidName(sc, ConsoleColors.YELLOW_BOLD + "Enter Your Last Name: " + ConsoleColors.RESET);


                        long number = 0;

                        while (true) {

                            number = readLongDigitsOnly(sc,
                                    ConsoleColors.YELLOW_BOLD + "Enter Your 10-Digit Mobile Number:(starting digit 6,7,8,9) " + ConsoleColors.RESET);
                            if (number >= 6000000000L && number <= 9999999999L) break;
                            else
                                System.out.println(ConsoleColors.RED_BOLD + "❌ Invalid number! Please enter a valid 10-digit mobile number." + ConsoleColors.RESET);
                        }
                        String email;
                        while (true) {
                            System.out.print(ConsoleColors.YELLOW_BOLD + "Enter Your Email: " + ConsoleColors.RESET);
                            email = sc.next();
                            if (email.endsWith("@gmail.com")) break;
                            else
                                System.out.println(ConsoleColors.RED_BOLD + "❌ Email must end with @gmail.com" + ConsoleColors.RESET);
                        }

                        int age;
                        while (true) {
                            System.out.print(ConsoleColors.YELLOW_BOLD + "Enter your Age: " + ConsoleColors.RESET);
                            age = readDigitsOnly(sc, "");
                            if (age > 0) break;
                            System.out.println(ConsoleColors.RED_BOLD + "❌ Age must be greater than 0" + ConsoleColors.RESET);
                        }

                        String password;
                        while (true) {
                            System.out.print(ConsoleColors.YELLOW_BOLD + "Enter your password: " + ConsoleColors.RESET);
                            password = sc.next();
                            if (password.length() < 8) {
                                System.out.println(ConsoleColors.RED_BOLD + "❌ Password too short. Must be at least 8 characters." + ConsoleColors.RESET);
                                continue;
                            }

                            boolean hasUpper = false, hasLower = false, hasDigit = false, hasSpecial = false;

                            for (char ch : password.toCharArray()) {
                                if (Character.isUpperCase(ch)) hasUpper = true;
                                else if (Character.isLowerCase(ch)) hasLower = true;
                                else if (Character.isDigit(ch)) hasDigit = true;
                                else if ("@#$%^&*!".indexOf(ch) >= 0) hasSpecial = true;
                            }

                            if (hasUpper && hasLower && hasDigit && hasSpecial) {
                                System.out.println(ConsoleColors.GREEN_BOLD + "✅ Strong password! Excellent choice!" + ConsoleColors.RESET);
                                break;
                            } else {
                                System.out.println(ConsoleColors.RED_BOLD + "❌ Weak password. Must contain uppercase, lowercase, digit, and special character." + ConsoleColors.RESET);
                            }
                        }
                        String sub = "no";
                        long user_id = number;
                        user u = new user(user_id, f_name, m_name, l_name, email, password, number, age, sub);
                        hm.put(user_id, u);
                        System.out.println(ConsoleColors.GREEN_BOLD + "\n🎉 User Registered Successfully!" + ConsoleColors.RESET);
                        System.out.println(ConsoleColors.CYAN_BOLD + "User Details: " + ConsoleColors.RESET + u);

                        String sql10 = "INSERT INTO user(user_id, first_name, middle_name, last_name, email, password, mobile_no,age,subscription) " + "VALUES(" + user_id + ",'" + f_name + "','" + m_name + "','" + l_name + "','" + email + "','" + password + "'," + number + "," + age + ",'" + sub + "')";
                        Statement s = con.createStatement();
                        s.executeUpdate(sql10);
                        System.out.println(ConsoleColors.GREEN_BOLD + "✅ User data added to database successfully!" + ConsoleColors.RESET);
                    } catch (Exception e) {
                        throw new RuntimeException(e);
                    }

                } else if (u_choice == 2) {
                    try {
                        Statement stmt = con.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT * FROM user");
                        while (rs.next()) {
                            long id = rs.getLong(1);
                            String fname = rs.getString(2);
                            String mname = rs.getString(3);
                            String lname = rs.getString(4);
                            String email = rs.getString(5);
                            String password = rs.getString(6);
                            long mob = rs.getLong(7);
                            int age = rs.getInt(8);
                            String sub = rs.getString(9);
                            user u = new user(id, fname, mname, lname, email, password, mob, age, sub);
                            hm.put(id, u);
                        }
                    } catch (Exception e) {
                        System.out.println(ConsoleColors.RED_BOLD + "❌ Error loading user data: " + e.getMessage() + ConsoleColors.RESET);
                    }

                    System.out.println(ConsoleColors.GREEN_BOLD + "\n🔑 User Login" + ConsoleColors.RESET);
                    System.out.println(ConsoleColors.CYAN_BOLD + "══════════════════════════════════════════" + ConsoleColors.RESET);
                    String mail;
                    while (true) {
                        System.out.print(ConsoleColors.YELLOW_BOLD + "Enter Your Email: " + ConsoleColors.RESET);
                        mail = sc.next();
                        if (mail.endsWith("@gmail.com")) break;
                        else
                            System.out.println(ConsoleColors.RED_BOLD + "❌ Email must end with @gmail.com" + ConsoleColors.RESET);
                    }

                    String pass;
                    while (true) {
                        System.out.print(ConsoleColors.YELLOW_BOLD + "Enter your password: " + ConsoleColors.RESET);
                        pass = sc.next();
                        if (pass.length() < 8) {
                            System.out.println(ConsoleColors.RED_BOLD + "❌ Password too short. Must be at least 8 characters." + ConsoleColors.RESET);
                            continue;
                        }

                        boolean hasUpper = false, hasLower = false, hasDigit = false, hasSpecial = false;

                        for (char ch : pass.toCharArray()) {
                            if (Character.isUpperCase(ch)) hasUpper = true;
                            else if (Character.isLowerCase(ch)) hasLower = true;
                            else if (Character.isDigit(ch)) hasDigit = true;
                            else if ("@#$%^&*!".indexOf(ch) >= 0) hasSpecial = true;
                        }

                        if (hasUpper && hasLower && hasDigit && hasSpecial) {
                            //System.out.println(ConsoleColors.GREEN_BOLD + "✅ Strong password! Excellent choice!" + ConsoleColors.RESET);
                            break;
                        } else {
                            System.out.println(ConsoleColors.RED_BOLD + "❌ Weak password. Must contain uppercase, lowercase, digit, and special character." + ConsoleColors.RESET);
                        }
                    }
                    long l = 0;
                    while (true) {

                        l = readLongDigitsOnly(sc,
                                ConsoleColors.YELLOW_BOLD + "Enter Your 10-Digit Mobile Number:(starting digit 6,7,8,9) " + ConsoleColors.RESET);
                        if (l >= 6000000000L && l <= 9999999999L) break;
                        else
                            System.out.println(ConsoleColors.RED_BOLD + "❌ Invalid number! Please enter a valid 10-digit mobile number." + ConsoleColors.RESET);
                    }
                    System.out.println(ConsoleColors.BLUE_BOLD + "\n📱 OTP Verification" + ConsoleColors.RESET);
                    int otp = 500000 + (int) (Math.random() * 90000);
                    System.out.println(ConsoleColors.CYAN_BOLD + "OTP Sent to your mobile: " + ConsoleColors.YELLOW_BOLD + otp + ConsoleColors.RESET);
                    int entered = readDigitsOnly(sc, ConsoleColors.BLUE_BOLD + "\nEnter OTP " + ConsoleColors.RESET);

                    boolean found = false;
                    for (user u : hm.values()) {
                        if (u.getEmail().equals(mail) && u.getPassword().equals(pass) && (otp == entered)) {
                            System.out.println(ConsoleColors.GREEN_BOLD + "\n🎉 Login Successful!" + ConsoleColors.RESET);
                            System.out.println(ConsoleColors.CYAN_BOLD + "Welcome back, " + ConsoleColors.YELLOW_BOLD + u.getFirst_name() + ConsoleColors.RESET + "! 👋");

                            //user code
                            while (true) {
                                System.out.println("\n" + ConsoleColors.BLUE_BOLD + "╔══════════════════════════════════════════╗" + ConsoleColors.RESET);
                                System.out.println(ConsoleColors.BLUE_BOLD + "║              User Dashboard              ║" + ConsoleColors.RESET);
                                System.out.println(ConsoleColors.BLUE_BOLD + "╚══════════════════════════════════════════╝" + ConsoleColors.RESET);
                                System.out.println(ConsoleColors.YELLOW_BOLD + "\n🎬 What would you like to do?" + ConsoleColors.RESET);
                                System.out.println(ConsoleColors.WHITE_BOLD + "  1️⃣  Watch Movies" + ConsoleColors.RESET);
                                System.out.println(ConsoleColors.WHITE_BOLD + "  2️⃣  Watch Series" + ConsoleColors.RESET);
                                System.out.println(ConsoleColors.WHITE_BOLD + "  3️⃣  View History" + ConsoleColors.RESET);
                                System.out.println(ConsoleColors.WHITE_BOLD + "  4️⃣  Top Rated Content" + ConsoleColors.RESET);
                                System.out.println(ConsoleColors.WHITE_BOLD + "  5️⃣  Subscription Details" + ConsoleColors.RESET);
                                System.out.println(ConsoleColors.WHITE_BOLD + "  6️⃣  Settings" + ConsoleColors.RESET);
                                System.out.println(ConsoleColors.WHITE_BOLD + "  7️⃣  Logout" + ConsoleColors.RESET);
                                int user_choice = readIntInRange(sc, ConsoleColors.CYAN_BOLD + "➤ Enter your choice: " + ConsoleColors.RESET, 1, 7);

                                if (user_choice == 7) {
                                    System.out.println(ConsoleColors.GREEN_BOLD + "\n👋 Logging out. See you soon!" + ConsoleColors.RESET);
                                    break;
                                } else if (user_choice == 1) {
                                    String s = "SELECT * FROM user where user_id =? ";
                                    PreparedStatement p = con.prepareStatement(s);
                                    p.setLong(1, l);
                                    ResultSet rt = p.executeQuery();
                                    String s1;
                                    while (rt.next()) {
                                        boolean sub = Boolean.parseBoolean(rt.getString("subscription"));
                                        if (sub) {
                                            s1 = "SELECT * FROM movie";
                                        } else {

                                            s1 = "SELECT * FROM movie WHERE movie_id IN(1,2,3,4,5,6,7)";
                                        }
                                        Statement statement = con.createStatement();
                                        ResultSet rs = statement.executeQuery(s1);
                                        List<Integer> movieIds = new ArrayList<>();
                                        System.out.println(ConsoleColors.GREEN_BOLD + "\n🎬 Available Movies (Premium Access):" + ConsoleColors.RESET);
                                        System.out.println(ConsoleColors.CYAN_BOLD + "══════════════════════════════════════════════════════════════════════════════════════════════════════" + ConsoleColors.RESET);

                                        while (rs.next()) {
                                            int id = rs.getInt("movie_id");
                                            String title = rs.getString("movie_title");
                                            String lan = rs.getString("movie_language");
                                            String cat = rs.getString("category");
                                            String path = rs.getString("video_path");
                                            String dur = rs.getString("duration");
                                            int lik = rs.getInt("lik");
                                            Movie m = new Movie(id, title, lan, cat, path, dur, lik);
                                            movieIds.add(id);
                                            System.out.println(ConsoleColors.YELLOW_BOLD + "Movie ID    : " + ConsoleColors.WHITE_BOLD + id + ConsoleColors.RESET);
                                            System.out.println(ConsoleColors.YELLOW_BOLD + "Title       : " + ConsoleColors.WHITE_BOLD + rs.getString("movie_title") + ConsoleColors.RESET);
                                            System.out.println(ConsoleColors.YELLOW_BOLD + "Language    : " + ConsoleColors.WHITE_BOLD + rs.getString("movie_language") + ConsoleColors.RESET);
                                            System.out.println(ConsoleColors.YELLOW_BOLD + "Category    : " + ConsoleColors.WHITE_BOLD + rs.getString("category") + ConsoleColors.RESET);
                                            System.out.println(ConsoleColors.YELLOW_BOLD + "path        : " + ConsoleColors.WHITE_BOLD + rs.getString("video_path") + ConsoleColors.RESET);
                                            System.out.println(ConsoleColors.YELLOW_BOLD + "Duration    : " + ConsoleColors.WHITE_BOLD + rs.getString("duration") + ConsoleColors.RESET);
                                            System.out.println(ConsoleColors.YELLOW_BOLD + "Likes       : " + ConsoleColors.WHITE_BOLD + rs.getInt("lik") + " ❤️" + ConsoleColors.RESET);
                                            System.out.println(ConsoleColors.CYAN_BOLD + "──────────────────────────────────────────────────────────────────────────────────────────────────" + ConsoleColors.RESET);
                                        }

                                        int movieIdToPlay = readDigitsOnly(sc, ConsoleColors.BLUE_BOLD + "\n🎯 Enter Movie ID to play or 0 to cancel: " + ConsoleColors.RESET);

                                        if (movieIdToPlay == 0) {
                                            System.out.println(ConsoleColors.YELLOW_BOLD + "⏹️  Movie playback canceled." + ConsoleColors.RESET);
                                        } else if (!movieIds.contains(movieIdToPlay)) {
                                            System.out.println(ConsoleColors.RED_BOLD + "❌ Invalid Movie ID." + ConsoleColors.RESET);
                                        } else {
                                            // Confirm whether to play or exit
                                            System.out.println(ConsoleColors.GREEN_BOLD + "\n🎬 Movie Playback Options:" + ConsoleColors.RESET);
                                            System.out.println(ConsoleColors.WHITE_BOLD + "  1️⃣  Play Movie" + ConsoleColors.RESET);
                                            System.out.println(ConsoleColors.WHITE_BOLD + "  2️⃣  Cancel" + ConsoleColors.RESET);
                                            int playChoice = readDigitsOnly(sc, ConsoleColors.BLUE_BOLD + "\n➤ Enter your choice: " + ConsoleColors.RESET);


                                            if (playChoice == 2) {
                                                System.out.println(ConsoleColors.YELLOW_BOLD + "⏹️  Movie play canceled." + ConsoleColors.RESET);
                                            } else if (playChoice == 1) {
                                                String getMovieName = "SELECT movie_title FROM movie WHERE movie_id = ?";
                                                PreparedStatement pstName = con.prepareStatement(getMovieName);
                                                pstName.setInt(1, movieIdToPlay);
                                                ResultSet rs2 = pstName.executeQuery();

                                                String movieTitle = null;
                                                if (rs2.next()) {
                                                    movieTitle = rs2.getString("movie_title");
                                                }

                                                // Simulate playback
                                                System.out.println(ConsoleColors.GREEN_BOLD + "\n▶️  Playing movie: " + ConsoleColors.YELLOW_BOLD + movieTitle + ConsoleColors.RESET);
                                                System.out.println(ConsoleColors.CYAN_BOLD + "🎬 Enjoy your movie! 🍿" + ConsoleColors.RESET);

                                                boolean likeChoice = readYesNo(sc,ConsoleColors.YELLOW_BOLD + "\nDid you like this movie? (Yes/No): " + ConsoleColors.RESET);

                                                if (likeChoice) {
                                                    String updateLike = "UPDATE movie SET lik = lik+1 WHERE movie_id = ?";
                                                    PreparedStatement pstLike = con.prepareStatement(updateLike);
                                                    pstLike.setInt(1, movieIdToPlay);
                                                    int rows = pstLike.executeUpdate();
                                                    if (rows > 0) {
                                                        System.out.println(ConsoleColors.GREEN_BOLD + "❤️  Thank you! Your like has been recorded." + ConsoleColors.RESET);
                                                    }
                                                }

                                                LocalDate today = LocalDate.now();
                                                LocalTime currentTime = LocalTime.now();


                                                String insertHistory = "INSERT INTO history (time, user_id, date, content_name) VALUES (?, ?, ?, ?)";
                                                PreparedStatement pst = con.prepareStatement(insertHistory);
                                                pst.setTime(1, Time.valueOf(currentTime));
                                                pst.setLong(2, l);
                                                pst.setDate(3, Date.valueOf(today));
                                                pst.setString(4, movieTitle);

                                                int rowsInserted = pst.executeUpdate();
                                                if (rowsInserted > 0) {
                                                    System.out.println(ConsoleColors.GREEN_BOLD + "✅ Watch history saved successfully." + ConsoleColors.RESET);
                                                } else {
                                                    System.out.println(ConsoleColors.RED_BOLD + "❌ Failed to insert into history." + ConsoleColors.RESET);
                                                }
                                            } else {
                                                System.out.println(ConsoleColors.RED_BOLD + "❌ Invalid choice." + ConsoleColors.RESET);
                                            }
                                        }
                                    }
                                } else if (user_choice == 2) {
                                    String s = "select * from series";
                                    Statement st = con.createStatement();
                                    ResultSet r = st.executeQuery(s);

                                    while (r.next()) {
                                        int id = r.getInt("id");
                                        String title = r.getString(2);
                                        Series s1 = new Series(id, title);
                                        int eid = r.getInt(3);
                                        String season = r.getString(4);
                                        int no = r.getInt(5);
                                        String path = r.getString(7);
                                        String dur = r.getString(8);
                                        Episode e = new Episode(id, season, title, no, path, dur);
                                    }
                                    //  Check subscription
                                    String userQuery = "SELECT * FROM user WHERE user_id = ?";
                                    PreparedStatement userStmt = con.prepareStatement(userQuery);
                                    userStmt.setLong(1, l);
                                    ResultSet userRS = userStmt.executeQuery();
                                    if (!userRS.next()) {
                                        System.out.println(ConsoleColors.RED_BOLD + "❌ User not found." + ConsoleColors.RESET);
                                        return;
                                    }
                                    boolean sub = Boolean.parseBoolean(userRS.getString("subscription"));

                                    List<String> seriesList = new ArrayList<>();
                                    String seriesSQL;
                                    if (sub) {
                                        // Premium user: show all series
                                        seriesSQL = "SELECT DISTINCT title FROM series";
                                        System.out.println(ConsoleColors.GREEN_BOLD + "\n📺 Available Series (Premium Access):" + ConsoleColors.RESET);
                                    } else {
                                        // Free user: show only some series
                                        seriesSQL = "SELECT DISTINCT  title FROM series WHERE id IN (1,2,3)";
                                        System.out.println(ConsoleColors.GREEN_BOLD + "\n📺 Available Series (Free Tier):" + ConsoleColors.RESET);
                                    }
                                    Statement seriesStmt = con.createStatement();
                                    ResultSet seriesRS = seriesStmt.executeQuery(seriesSQL);

                                    int sIdx = 1;
                                    while (seriesRS.next()) {

                                        String title = seriesRS.getString("title");
                                        seriesList.add(title);
                                        System.out.println(ConsoleColors.YELLOW_BOLD + sIdx + ". " + ConsoleColors.WHITE_BOLD + title + ConsoleColors.RESET);
                                        sIdx++;
                                    }
                                    if (seriesList.isEmpty()) {
                                        System.out.println(ConsoleColors.RED_BOLD + "❌ No series available." + ConsoleColors.RESET);
                                        return;
                                    }


                                    int seriesChoice = readDigitsOnly(sc, ConsoleColors.BLUE_BOLD + "\n🎯 Enter the number of the series you want to watch: " + ConsoleColors.RESET);
                                    if (seriesChoice < 1 || seriesChoice > seriesList.size()) {
                                        System.out.println(ConsoleColors.RED_BOLD + "❌ Invalid series selection." + ConsoleColors.RESET);
                                        return;
                                    }
                                    String selectedSeries = seriesList.get(seriesChoice - 1);


                                    // Step 5: Show available seasons for selected series
                                    List<Integer> seasons = new ArrayList<>();
                                    String seasonSQL = "SELECT DISTINCT season FROM series WHERE title = ?";
                                    PreparedStatement seasonStmt = con.prepareStatement(seasonSQL);
                                    seasonStmt.setString(1, selectedSeries);
                                    ResultSet seasonRS = seasonStmt.executeQuery();

                                    System.out.println(ConsoleColors.GREEN_BOLD + "\n📺 Available Seasons for " + selectedSeries + ":" + ConsoleColors.RESET);
                                    int seasIdx = 1;
                                    while (seasonRS.next()) {
                                        int seasonNum = seasonRS.getInt("season");
                                        seasons.add(seasonNum);
                                        System.out.println(ConsoleColors.YELLOW_BOLD + seasIdx + ". " + ConsoleColors.WHITE_BOLD + "Season " + seasonNum + ConsoleColors.RESET);
                                        seasIdx++;
                                    }
                                    if (seasons.isEmpty()) {
                                        System.out.println(ConsoleColors.RED_BOLD + "❌ No seasons available for this series." + ConsoleColors.RESET);
                                        return;
                                    }

                                    // Step 6: Ask for season choice
                                    System.out.print(ConsoleColors.BLUE_BOLD + "\n🎯 Enter the number of the season you want to watch: " + ConsoleColors.RESET);
                                    int seasonChoice = readDigitsOnly(sc, ConsoleColors.BLUE_BOLD + "\n➤ Enter your choice: " + ConsoleColors.RESET);
                                    if (seasonChoice < 1 || seasonChoice > seasons.size()) {
                                        System.out.println(ConsoleColors.RED_BOLD + "❌ Invalid season selection." + ConsoleColors.RESET);
                                        return;
                                    }
                                    int selectedSeason = seasons.get(seasonChoice - 1);

                                    Map<Integer, String> episodeMap = new HashMap<>();
                                    String episodeSQL = "SELECT * FROM series WHERE title = ? AND season = ? ORDER BY episodeNO";
                                    PreparedStatement episodeStmt = con.prepareStatement(episodeSQL);
                                    episodeStmt.setString(1, selectedSeries);
                                    episodeStmt.setInt(2, selectedSeason);
                                    ResultSet episodesRS = episodeStmt.executeQuery();

                                    System.out.println(ConsoleColors.GREEN_BOLD + "\n📺 Episodes in: " + ConsoleColors.YELLOW_BOLD + selectedSeries + ", Season " + selectedSeason + ConsoleColors.RESET);
                                    System.out.println(ConsoleColors.CYAN_BOLD + "══════════════════════════════════════════════════════════════════════════════════════════════════════" + ConsoleColors.RESET);
                                    while (episodesRS.next()) {
                                        int episodeID = episodesRS.getInt("episodeID");
                                        int episodeNo = episodesRS.getInt("episodeNO");
                                        String episodeName = episodesRS.getString("episode_name");
                                        String duration = episodesRS.getString("duration");
                                        int likes = episodesRS.getInt("lik");
                                        episodeMap.put(episodeID, episodeName);

                                        System.out.println(ConsoleColors.YELLOW_BOLD + "Episode ID   : " + ConsoleColors.WHITE_BOLD + episodeID + ConsoleColors.RESET);
                                        System.out.println(ConsoleColors.YELLOW_BOLD + "Episode No   : " + ConsoleColors.WHITE_BOLD + episodeNo + ConsoleColors.RESET);
                                        System.out.println(ConsoleColors.YELLOW_BOLD + "Name         : " + ConsoleColors.WHITE_BOLD + episodeName + ConsoleColors.RESET);
                                        System.out.println(ConsoleColors.YELLOW_BOLD + "path         : " + ConsoleColors.WHITE_BOLD + episodesRS.getString("video_path") + ConsoleColors.RESET);
                                        System.out.println(ConsoleColors.YELLOW_BOLD + "Duration     : " + ConsoleColors.WHITE_BOLD + duration + ConsoleColors.RESET);
                                        System.out.println(ConsoleColors.YELLOW_BOLD + "Likes        : " + ConsoleColors.WHITE_BOLD + likes + " ❤️" + ConsoleColors.RESET);
                                        System.out.println(ConsoleColors.CYAN_BOLD + "──────────────────────────────────────────────────────────────────────────────────────────────────" + ConsoleColors.RESET);
                                    }
                                    if (episodeMap.isEmpty()) {
                                        System.out.println(ConsoleColors.RED_BOLD + "❌ No episodes available for this season." + ConsoleColors.RESET);
                                        return;
                                    }

                                    int episodeIdToPlay = readDigitsOnly(sc, ConsoleColors.BLUE_BOLD + "\n🎯 Enter Movie ID to play or 0 to cancel: " + ConsoleColors.RESET);

                                    if (episodeIdToPlay == 0) {
                                        System.out.println(ConsoleColors.YELLOW_BOLD + "⏹️  Playback canceled." + ConsoleColors.RESET);
                                        return;
                                    }
                                    if (!episodeMap.containsKey(episodeIdToPlay)) {
                                        System.out.println(ConsoleColors.RED_BOLD + "❌ Invalid Episode ID." + ConsoleColors.RESET);
                                        return;
                                    }

                                    System.out.println(ConsoleColors.GREEN_BOLD + "\n📺 Episode Playback Options:" + ConsoleColors.RESET);
                                    System.out.println(ConsoleColors.WHITE_BOLD + "  1️⃣  Play Episode" + ConsoleColors.RESET);
                                    System.out.println(ConsoleColors.WHITE_BOLD + "  2️⃣  Cancel" + ConsoleColors.RESET);
                                    int playChoice = readDigitsOnly(sc, ConsoleColors.BLUE_BOLD + "\n➤ Enter your choice: " + ConsoleColors.RESET);

                                    if (playChoice == 2) {
                                        System.out.println(ConsoleColors.YELLOW_BOLD + "⏹️  Playback canceled." + ConsoleColors.RESET);
                                        return;
                                    } else if (playChoice == 1) {
                                        String episodeName = episodeMap.get(episodeIdToPlay);
                                        System.out.println(ConsoleColors.GREEN_BOLD + "\n▶️  Playing: " + ConsoleColors.YELLOW_BOLD + episodeName + ConsoleColors.RESET);
                                        System.out.println(ConsoleColors.CYAN_BOLD + "📺 Enjoy your episode! 🍿" + ConsoleColors.RESET);


                                        System.out.print(ConsoleColors.YELLOW_BOLD + "\nDid you like this episode? (Yes/No): " + ConsoleColors.RESET);
                                        boolean likeChoice = readYesNo(sc, ConsoleColors.YELLOW_BOLD + "\nDid you like this movie? (Yes/No): " + ConsoleColors.RESET);
                                        if (likeChoice) {
                                            String updateLike = "UPDATE series SET lik = lik + 1 WHERE episodeID = ?";
                                            PreparedStatement pstLike = con.prepareStatement(updateLike);
                                            pstLike.setInt(1, episodeIdToPlay);
                                            int rows = pstLike.executeUpdate();
                                            if (rows > 0) {
                                                System.out.println(ConsoleColors.GREEN_BOLD + "❤️  Like recorded." + ConsoleColors.RESET);
                                            }

                                            String updateLike1 = "UPDATE series_name SET lik = lik + 1 WHERE id = ?";
                                            PreparedStatement pstLike1 = con.prepareStatement(updateLike1);
                                            pstLike1.setInt(1, seriesChoice);
                                        }

                                        // Save to history
                                        LocalDate today = LocalDate.now();
                                        LocalTime currentTime = LocalTime.now();

                                        String insertHistory = "INSERT INTO history (time, user_id, date, content_name) VALUES (?, ?, ?, ?)";
                                        PreparedStatement pstHistory = con.prepareStatement(insertHistory);
                                        pstHistory.setTime(1, Time.valueOf(currentTime));
                                        pstHistory.setLong(2, l);
                                        pstHistory.setDate(3, Date.valueOf(today));
                                        pstHistory.setString(4, episodeName);
                                        int rowsInserted = pstHistory.executeUpdate();
                                        if (rowsInserted > 0) {
                                            System.out.println(ConsoleColors.GREEN_BOLD + "✅ Watch history saved." + ConsoleColors.RESET);
                                        } else {
                                            System.out.println(ConsoleColors.RED_BOLD + "❌ Failed to save history." + ConsoleColors.RESET);
                                        }
                                    } else {
                                        System.out.println(ConsoleColors.RED_BOLD + "❌ Invalid choice." + ConsoleColors.RESET);
                                    }
                                } else if (user_choice == 3) {
                                    System.out.println(ConsoleColors.GREEN_BOLD + "\n📚 Watch History" + ConsoleColors.RESET);
                                    System.out.println(ConsoleColors.CYAN_BOLD + "══════════════════════════════════════════════════════════════════════════════════════════════════════" + ConsoleColors.RESET);
                                    String s = "SELECT * FROM history WHERE user_id=? ORDER BY his_ID DESC LIMIT 5 ";
                                    PreparedStatement pst = con.prepareStatement(s);
                                    pst.setLong(1, l);
                                    ResultSet rs = pst.executeQuery();
                                    boolean hasHistory = false;
                                    while (rs.next()) {
                                        int id = rs.getInt(1);
                                        String time = rs.getString(2);
                                        long num = rs.getLong(3);
                                        String date = rs.getString(4);
                                        String content = rs.getString(5);
                                        Histrory h = new Histrory(id, date, time, num, content);
                                        hasHistory = true;
                                        System.out.println(ConsoleColors.YELLOW_BOLD + "History ID   : " + ConsoleColors.WHITE_BOLD + rs.getInt(1) + ConsoleColors.RESET);
                                        System.out.println(ConsoleColors.YELLOW_BOLD + "Time         : " + ConsoleColors.WHITE_BOLD + rs.getTime(2) + ConsoleColors.RESET);
                                        System.out.println(ConsoleColors.YELLOW_BOLD + "User ID      : " + ConsoleColors.WHITE_BOLD + rs.getLong(3) + ConsoleColors.RESET);
                                        System.out.println(ConsoleColors.YELLOW_BOLD + "Date         : " + ConsoleColors.WHITE_BOLD + rs.getDate(4) + ConsoleColors.RESET);
                                        System.out.println(ConsoleColors.YELLOW_BOLD + "Content      : " + ConsoleColors.WHITE_BOLD + rs.getString(5) + ConsoleColors.RESET);
                                        System.out.println(ConsoleColors.CYAN_BOLD + "──────────────────────────────────────────────────────────────────────────────────────────────────" + ConsoleColors.RESET);
                                    }
                                    if (!hasHistory) {
                                        System.out.println(ConsoleColors.YELLOW_BOLD + "📝 No watch history found. Start watching some content!" + ConsoleColors.RESET);
                                    }
                                } else if (user_choice == 4) {
                                    System.out.println(ConsoleColors.GREEN_BOLD + "\n🏆 Top Rated Movies & Series (by Likes)" + ConsoleColors.RESET);
                                    System.out.println(ConsoleColors.CYAN_BOLD + "══════════════════════════════════════════════════════════════════════════════════════════════════════" + ConsoleColors.RESET);

                                    BST bst = new BST();

                                    // --- Fetch and insert Movies ---
                                    String movieSQL = "SELECT movie_title, lik FROM movie";
                                    Statement stmt1 = con.createStatement();
                                    ResultSet rs1 = stmt1.executeQuery(movieSQL);
                                    while (rs1.next()) {
                                        String title = rs1.getString("movie_title");
                                        int likes = rs1.getInt("lik");
                                        bst.insert(likes, title, "Movie");
                                    }

                                    // --- Fetch and insert Series ---
                                    String seriesSQL = "SELECT * FROM series_data";
                                    Statement stmt2 = con.createStatement();
                                    ResultSet rs2 = stmt2.executeQuery(seriesSQL);
                                    while (rs2.next()) {
                                        String title = rs2.getString(2);
                                        int likes = rs2.getInt("lik");
                                        bst.insert(likes, title, "Series");
                                    }
                                    bst.printDescending();
                                } else if (user_choice == 5) {

                                    System.out.println(ConsoleColors.GREEN_BOLD + "\n💎 Subscription Management" + ConsoleColors.RESET);
                                    System.out.println(ConsoleColors.CYAN_BOLD + "══════════════════════════════════════════════════════════════════════════════════════════════════════" + ConsoleColors.RESET);
                                    System.out.println(ConsoleColors.YELLOW_BOLD + "Choose an option:" + ConsoleColors.RESET);
                                    System.out.println(ConsoleColors.WHITE_BOLD + "  1️⃣  V" +
                                            "iew Available Plans" + ConsoleColors.RESET);
                                    System.out.println(ConsoleColors.WHITE_BOLD + "  2️⃣  Purchase Subscription" + ConsoleColors.RESET);
                                    System.out.println(ConsoleColors.WHITE_BOLD + "  3️⃣  View Current Subscription" + ConsoleColors.RESET);
                                    System.out.print(ConsoleColors.BLUE_BOLD + "\n➤ Enter your choice: " + ConsoleColors.RESET);
                                    int subChoice = sc.nextInt();
                                    String q = "Select * From subscription_plan ";
                                    Statement s7 = con.createStatement();
                                    ResultSet rs = s7.executeQuery(q);
                                    while (rs.next()) {
                                        int id = rs.getInt(1);
                                        String type = rs.getString(2);
                                        String Start = rs.getString(3);
                                        String end = rs.getString(4);
                                        long user = rs.getLong(5);
                                        Subscription s = new Subscription(id, user, type, Start, end);
                                    }
                                    LocalDate startDate = LocalDate.now();
                                    LocalDate endDate = startDate.plusMonths(1);  // 1-month subscription period

                                    switch (subChoice) {
                                        case 1:
                                            // Show available subscription plans and prices
                                            System.out.println(ConsoleColors.GREEN_BOLD + "\n📋 Available Subscription Plans:" + ConsoleColors.RESET);
                                            System.out.println(ConsoleColors.CYAN_BOLD + "══════════════════════════════════════════════════════════════════════════════════════════════════════" + ConsoleColors.RESET);
                                            System.out.println(ConsoleColors.YELLOW_BOLD + "1️⃣  Basic Plan     - ₹299/month (1 mobile login)" + ConsoleColors.RESET);
                                            System.out.println(ConsoleColors.YELLOW_BOLD + "2️⃣  Standard Plan  - ₹499/month (2 mobile login)" + ConsoleColors.RESET);
                                            System.out.println(ConsoleColors.YELLOW_BOLD + "3️⃣  Premium Plan   - ₹799/month (3 mobile login)" + ConsoleColors.RESET);
                                            break;

                                        case 2:
                                            String checkSub = "SELECT subscription FROM user WHERE user_id = ?";
                                            PreparedStatement subPst = con.prepareStatement(checkSub);
                                            subPst.setLong(1, l);
                                            ResultSet subRs = subPst.executeQuery();
                                            // Buy subscription
                                            System.out.println(ConsoleColors.GREEN_BOLD + "\n🛒 Select Plan to Purchase:" + ConsoleColors.RESET);
                                            System.out.println(ConsoleColors.CYAN_BOLD + "══════════════════════════════════════════════════════════════════════════════════════════════════════" + ConsoleColors.RESET);
                                            System.out.println(ConsoleColors.YELLOW_BOLD + "1️⃣  Basic Plan     - ₹299/month" + ConsoleColors.RESET);
                                            System.out.println(ConsoleColors.YELLOW_BOLD + "2️⃣  Standard Plan  - ₹499/month" + ConsoleColors.RESET);
                                            System.out.println(ConsoleColors.YELLOW_BOLD + "3️⃣  Premium Plan   - ₹799/month" + ConsoleColors.RESET);
                                            int planChoice = readDigitsOnly(sc, ConsoleColors.BLUE_BOLD + "\n➤ Enter your choice: " + ConsoleColors.RESET);
                                            String planType;
                                            try {

                                                switch (planChoice) {
                                                    case 1:
                                                        planType = "Basic";
                                                        try {
                                                            String s = "insert into subscription_plan (type,Start_date,end_date,user_id)VALUES(?,?,?,?)";
                                                            PreparedStatement pst = con.prepareStatement(s);
                                                            pst.setString(1, "basic");
                                                            pst.setDate(2, Date.valueOf(startDate));
                                                            pst.setDate(3, Date.valueOf(endDate));
                                                            pst.setLong(4, l);
                                                            pst.executeUpdate();
                                                            String sql = "UPDATE user SET subscription = 'true' WHERE user_id =?";
                                                            PreparedStatement pspt = con.prepareStatement(sql);
                                                            pspt.setLong(1, l);
                                                            pspt.executeUpdate();
                                                            System.out.println(ConsoleColors.GREEN_BOLD + "✅ Basic Plan subscription added successfully!" + ConsoleColors.RESET);
                                                        } catch (SQLException ex) {
                                                            System.out.println(ConsoleColors.YELLOW_BOLD + "⚠️ " + ex.getMessage() + ConsoleColors.RESET);
                                                        }
                                                        break;
                                                    case 2:
                                                        planType = "Standard";
                                                        try {
                                                            String s1 = "insert into subscription_plan (type,Start_date,end_date,user_id)VALUES(?,?,?,?)";
                                                            PreparedStatement pst1 = con.prepareStatement(s1);
                                                            pst1.setString(1, "Standard");
                                                            pst1.setDate(2, Date.valueOf(startDate));
                                                            pst1.setDate(3, Date.valueOf(endDate));
                                                            pst1.setLong(4, l);
                                                            pst1.executeUpdate();
                                                            String sql1 = "UPDATE user SET subscription = 'true' WHERE user_id =?";
                                                            PreparedStatement pspt1 = con.prepareStatement(sql1);
                                                            pspt1.setLong(1, l);
                                                            pspt1.executeUpdate();
                                                            System.out.println(ConsoleColors.GREEN_BOLD + "✅ Standard Plan subscription added successfully!" + ConsoleColors.RESET);
                                                        } catch (SQLException ex) {
                                                            System.out.println(ConsoleColors.YELLOW_BOLD + "⚠️ " + ex.getMessage() + ConsoleColors.RESET);
                                                        }
                                                        break;
                                                    case 3:
                                                        planType = "Premium";
                                                        try {
                                                            String s2 = "insert into subscription_plan (type,Start_date,end_date,user_id)VALUES(?,?,?,?)";
                                                            PreparedStatement pst2 = con.prepareStatement(s2);
                                                            pst2.setString(1, "Premium");
                                                            pst2.setDate(2, Date.valueOf(startDate));
                                                            pst2.setDate(3, Date.valueOf(endDate));
                                                            pst2.setLong(4, l);
                                                            pst2.executeUpdate();
                                                            String sql2 = "UPDATE user SET subscription = 'true' WHERE user_id =?";
                                                            PreparedStatement pspt2 = con.prepareStatement(sql2);
                                                            pspt2.setLong(1, l);
                                                            pspt2.executeUpdate();
                                                            System.out.println(ConsoleColors.GREEN_BOLD + "✅ Premium Plan subscription added successfully!" + ConsoleColors.RESET);
                                                        } catch (SQLException ex) {
                                                            System.out.println(ConsoleColors.YELLOW_BOLD + "⚠️ " + ex.getMessage() + ConsoleColors.RESET);
                                                        }
                                                        break;
                                                    default:
                                                        System.out.println(ConsoleColors.RED_BOLD + "❌ Invalid plan choice." + ConsoleColors.RESET);
                                                        return; // or break to exit this block
                                                }
                                            } catch (Exception e) {
                                                throw new RuntimeException(e);
                                            }

                                            break;

                                        case 3:
                                            System.out.println(ConsoleColors.GREEN_BOLD + "\n📋 Your Current Subscription Details:" + ConsoleColors.RESET);
                                            System.out.println(ConsoleColors.CYAN_BOLD + "══════════════════════════════════════════════════════════════════════════════════════════════════════" + ConsoleColors.RESET);
                                            String sql = "SELECT * FROM subscription_plan WHERE user_id=?";
                                            PreparedStatement pst3 = con.prepareStatement(sql);
                                            pst3.setLong(1, l);
                                            ResultSet rst = pst3.executeQuery();
                                            boolean hasSubscription = false;
                                            while (rst.next()) {
                                                hasSubscription = true;
                                                System.out.println(ConsoleColors.YELLOW_BOLD + "Subscription ID : " + ConsoleColors.WHITE_BOLD + rst.getInt(1) + ConsoleColors.RESET);
                                                System.out.println(ConsoleColors.YELLOW_BOLD + "Plan Type      : " + ConsoleColors.WHITE_BOLD + rst.getString(2) + ConsoleColors.RESET);
                                                System.out.println(ConsoleColors.YELLOW_BOLD + "Start Date     : " + ConsoleColors.WHITE_BOLD + rst.getDate(3) + ConsoleColors.RESET);
                                                System.out.println(ConsoleColors.YELLOW_BOLD + "End Date       : " + ConsoleColors.WHITE_BOLD + rst.getDate(4) + ConsoleColors.RESET);
                                                System.out.println(ConsoleColors.YELLOW_BOLD + "User ID        : " + ConsoleColors.WHITE_BOLD + rst.getLong(5) + ConsoleColors.RESET);
                                                System.out.println(ConsoleColors.CYAN_BOLD + "──────────────────────────────────────────────────────────────────────────────────────────────────" + ConsoleColors.RESET);
                                            }
                                            if (!hasSubscription) {
                                                System.out.println(ConsoleColors.YELLOW_BOLD + "📝 No active subscription found. Consider purchasing a plan!" + ConsoleColors.RESET);
                                            }
                                            break;

                                        default:
                                            System.out.println(ConsoleColors.RED_BOLD + "❌ Invalid choice." + ConsoleColors.RESET);
                                    }
                                }

                                if (user_choice == 6) {
                                    System.out.println(ConsoleColors.GREEN_BOLD + "\n⚙️  Settings" + ConsoleColors.RESET);
                                    System.out.println(ConsoleColors.CYAN_BOLD + "══════════════════════════════════════════════════════════════════════════════════════════════════════" + ConsoleColors.RESET);
                                    System.out.println(ConsoleColors.YELLOW_BOLD + "Choose an option:" + ConsoleColors.RESET);
                                    System.out.println(ConsoleColors.WHITE_BOLD + "  1️⃣  Change Password" + ConsoleColors.RESET);
                                    System.out.println(ConsoleColors.WHITE_BOLD + "  2️⃣  Change Mobile Number" + ConsoleColors.RESET);
                                    int settingChoice = readDigitsOnly(sc, ConsoleColors.BLUE_BOLD + "\n➤ Enter your choice: " + ConsoleColors.RESET);

                                    if (settingChoice == 1) {
                                        System.out.print(ConsoleColors.YELLOW_BOLD + "Enter new password: " + ConsoleColors.RESET);
                                        String newPass = sc.next();
                                        String updatePass = "UPDATE user SET password = ? WHERE user_id = ?";
                                        PreparedStatement pst = con.prepareStatement(updatePass);
                                        pst.setString(1, newPass);
                                        pst.setLong(2, l);
                                        int updated = pst.executeUpdate();
                                        System.out.println((updated > 0) ? ConsoleColors.GREEN_BOLD + "✅ Password updated successfully!" + ConsoleColors.RESET : ConsoleColors.RED_BOLD + "❌ Failed to update password." + ConsoleColors.RESET);
                                    } else if (settingChoice == 2) {
                                        System.out.print(ConsoleColors.YELLOW_BOLD + "Enter new mobile number: " + ConsoleColors.RESET);

                                        long newMob = readLongDigitsOnly(sc, ConsoleColors.YELLOW_BOLD + "Enter Your 10-Digit Mobile Number:(starting digit 6,7,8,9) " + ConsoleColors.RESET);
                                        String updateMob = "UPDATE user SET mobile_no = ? WHERE user_id = ?";
                                        PreparedStatement pst = con.prepareStatement(updateMob);
                                        pst.setLong(1, newMob);
                                        pst.setLong(2, l);
                                        int updated = pst.executeUpdate();
                                        System.out.println((updated > 0) ? ConsoleColors.GREEN_BOLD + "✅ Mobile number updated successfully!" + ConsoleColors.RESET : ConsoleColors.RED_BOLD + "❌ Failed to update mobile number." + ConsoleColors.RESET);
                                    } else {
                                        System.out.println(ConsoleColors.RED_BOLD + "❌ Invalid choice." + ConsoleColors.RESET);
                                    }
                                }

                            }

                        }
                    }

                }
                if (u_choice == 3) {
                    System.out.println(ConsoleColors.GREEN_BOLD + "\n👋 Exiting User Dashboard. Goodbye!" + ConsoleColors.RESET);
                    break;
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    void adminlogsign(Connection con, HashMap<Long, Admin> hmu) throws SQLException {
        try {
            while (true) {
                System.out.println(ConsoleColors.PURPLE_BOLD + "╔══════════════════════════════════════════╗" + ConsoleColors.RESET);
                System.out.println(ConsoleColors.PURPLE_BOLD + "║              Admin Portal                ║" + ConsoleColors.RESET);
                System.out.println(ConsoleColors.PURPLE_BOLD + "╚══════════════════════════════════════════╝" + ConsoleColors.RESET);
                System.out.println(ConsoleColors.YELLOW_BOLD + "\n🔐 Choose Action:" + ConsoleColors.RESET);
                System.out.println(ConsoleColors.WHITE_BOLD + "  1️⃣  Admin Sign Up" + ConsoleColors.RESET);
                System.out.println(ConsoleColors.WHITE_BOLD + "  2️⃣  Admin Log In" + ConsoleColors.RESET);
                System.out.println(ConsoleColors.WHITE_BOLD + "  3️⃣  Back to Main Menu" + ConsoleColors.RESET);
                int A_choice = readIntInRange(sc, ConsoleColors.CYAN_BOLD + "➤ Enter your choice: " + ConsoleColors.RESET, 1, 3);

                if (A_choice == 1) {
                    System.out.println(ConsoleColors.GREEN_BOLD + "📝 Admin Registration Form" + ConsoleColors.RESET);
                    System.out.println(ConsoleColors.CYAN_BOLD + "══════════════════════════════════════════" + ConsoleColors.RESET);
                    String name = readValidName(sc, ConsoleColors.YELLOW_BOLD + "Enter full name: " + ConsoleColors.RESET);

                    long number1;
                    while (true) {
                        number1 = readLongDigitsOnly(sc, ConsoleColors.YELLOW_BOLD + "Enter Your 10-Digit Mobile Number:(starting digit 6,7,8,9) " + ConsoleColors.RESET);
                        if (number1 >= 6000000000L && number1 <= 9999999999L) break;
                        else
                            System.out.println(ConsoleColors.RED_BOLD + "❌ Invalid number! Please enter a valid 10-digit mobile number." + ConsoleColors.RESET);
                    }

                    String email1;
                    while (true) {
                        System.out.print(ConsoleColors.YELLOW_BOLD + "Enter Your Email: " + ConsoleColors.RESET);
                        email1 = sc.next();
                        if (email1.endsWith("@gmail.com")) break;
                        else
                            System.out.println(ConsoleColors.RED_BOLD + "❌ Email must end with @gmail.com" + ConsoleColors.RESET);
                    }

                    String password1;
                    while (true) {
                        System.out.print(ConsoleColors.YELLOW_BOLD + "Enter your password: " + ConsoleColors.RESET);
                        password1 = sc.next();
                        if (password1.length() < 8) {
                            System.out.println(ConsoleColors.RED_BOLD + "❌ Password too short. Must be at least 8 characters." + ConsoleColors.RESET);
                            continue;
                        }

                        boolean hasUpper1 = false, hasLower1 = false, hasDigit1 = false, hasSpecial1 = false;
                        for (char ch : password1.toCharArray()) {
                            if (Character.isUpperCase(ch)) hasUpper1 = true;
                            else if (Character.isLowerCase(ch)) hasLower1 = true;
                            else if (Character.isDigit(ch)) hasDigit1 = true;
                            else if ("@#$%^&*!".indexOf(ch) >= 0) hasSpecial1 = true;
                        }

                        if (hasUpper1 && hasLower1 && hasDigit1 && hasSpecial1) {
                            System.out.println(ConsoleColors.GREEN_BOLD + "✅ Strong password! Excellent choice!" + ConsoleColors.RESET);
                            break;
                        } else {
                            System.out.println(ConsoleColors.RED_BOLD + "❌ Weak password. Must contain uppercase, lowercase, digit, and special character." + ConsoleColors.RESET);
                        }
                    }

                    long Admin_id1 = number1;
                    Admin a1 = new Admin(Admin_id1, name, email1, password1);
                    hmu.put(Admin_id1, a1);

                    // Insert into DB
                    try {
                        String sql10 = "INSERT INTO admin VALUES(" + Admin_id1 + ",'" + name + "','" + email1 + "','" + password1 + "')";
                        Statement s = con.createStatement();
                        s.executeUpdate(sql10);
                        System.out.println(ConsoleColors.GREEN_BOLD + "✅ Admin Registered & Added to Database Successfully!" + ConsoleColors.RESET);
                    } catch (Exception e) {
                        System.out.println(ConsoleColors.RED_BOLD + "❌ Error inserting into admin table: " + e.getMessage() + ConsoleColors.RESET);
                    }
                } else if (A_choice == 2) {

                    try {
                        Statement stmt = con.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT * FROM admin");
                        while (rs.next()) {
                            long id = rs.getLong("admin_id");
                            String name = rs.getString("admin_name");
                            String email = rs.getString("admin_email");
                            String password = rs.getString("admin_password");
                            Admin adminObj = new Admin(id, name, email, password);
                            hmu.put(id, adminObj);
                        }
                    } catch (Exception e) {
                        System.out.println(ConsoleColors.RED_BOLD + "❌ Error loading admin data: " + e.getMessage() + ConsoleColors.RESET);
                    }

                    //  Login Logic
                    System.out.println(ConsoleColors.GREEN_BOLD + "\n🔑 Admin Login" + ConsoleColors.RESET);
                    System.out.println(ConsoleColors.CYAN_BOLD + "══════════════════════════════════════════" + ConsoleColors.RESET);
                    System.out.print(ConsoleColors.YELLOW_BOLD + "Enter Your Email: " + ConsoleColors.RESET);
                    String mail1;
                    while (true) {
                        System.out.print(ConsoleColors.YELLOW_BOLD + "Enter Your Email: " + ConsoleColors.RESET);
                        mail1 = sc.next();
                        if (mail1.endsWith("@gmail.com")) break;
                        else
                            System.out.println(ConsoleColors.RED_BOLD + "❌ Email must end with @gmail.com" + ConsoleColors.RESET);
                    }
                    String pass1;
                    while (true) {
                        System.out.print(ConsoleColors.YELLOW_BOLD + "Enter your password: " + ConsoleColors.RESET);
                        pass1 = sc.next();
                        if (pass1.length() < 8) {
                            System.out.println(ConsoleColors.RED_BOLD + "❌ Password too short. Must be at least 8 characters." + ConsoleColors.RESET);
                            continue;
                        }

                        boolean hasUpper1 = false, hasLower1 = false, hasDigit1 = false, hasSpecial1 = false;
                        for (char ch : pass1.toCharArray()) {
                            if (Character.isUpperCase(ch)) hasUpper1 = true;
                            else if (Character.isLowerCase(ch)) hasLower1 = true;
                            else if (Character.isDigit(ch)) hasDigit1 = true;
                            else if ("@#$%^&*!".indexOf(ch) >= 0) hasSpecial1 = true;
                        }

                        if (hasUpper1 && hasLower1 && hasDigit1 && hasSpecial1) {
                            System.out.println(ConsoleColors.GREEN_BOLD + "✅ Strong password! Excellent choice!" + ConsoleColors.RESET);
                            break;
                        } else {
                            System.out.println(ConsoleColors.RED_BOLD + "❌ Weak password. Must contain uppercase, lowercase, digit, and special character." + ConsoleColors.RESET);
                        }
                    }

                    System.out.println(ConsoleColors.BLUE_BOLD + "\n📱 OTP Verification" + ConsoleColors.RESET);
                    int otp2 = (int) (500000 + Math.random() * 90000);
                    System.out.println(ConsoleColors.CYAN_BOLD + "OTP Sent to your mobile: " + ConsoleColors.YELLOW_BOLD + otp2 + ConsoleColors.RESET);
                    System.out.print(ConsoleColors.YELLOW_BOLD + "Enter OTP: " + ConsoleColors.RESET);
                    int entered = readDigitsOnly(sc, "");

                    boolean found = false;
                    for (Admin a1 : hmu.values()) {
                        if (a1.getEmail().equals(mail1) && a1.getAdmin_password().equals(pass1) && otp2 == entered) {
                            System.out.println(ConsoleColors.GREEN_BOLD + "\n🎉 Admin Login Successful!" + ConsoleColors.RESET);
                            System.out.println(ConsoleColors.CYAN_BOLD + "Welcome, " + ConsoleColors.YELLOW_BOLD + a1.admin_name + ConsoleColors.RESET + "! 👨‍💼");
                            while (true) {
                                System.out.println(ConsoleColors.PURPLE_BOLD + "╔══════════════════════════════════════════╗" + ConsoleColors.RESET);
                                System.out.println(ConsoleColors.PURPLE_BOLD + "║              Admin Dashboard             ║" + ConsoleColors.RESET);
                                System.out.println(ConsoleColors.PURPLE_BOLD + "╚══════════════════════════════════════════╝" + ConsoleColors.RESET);
                                System.out.println(ConsoleColors.YELLOW_BOLD + "\n🎬 Movie Management:" + ConsoleColors.RESET);
                                System.out.println(ConsoleColors.WHITE_BOLD + "  1️⃣  Insert Movies " + ConsoleColors.RESET);
                                System.out.println(ConsoleColors.WHITE_BOLD + "  2️⃣  Update Movie" + ConsoleColors.RESET);
                                System.out.println(ConsoleColors.WHITE_BOLD + "  3️⃣  Delete Movie" + ConsoleColors.RESET);
                                System.out.println(ConsoleColors.WHITE_BOLD + "  4️⃣  View All Movies" + ConsoleColors.RESET);
                                System.out.println(ConsoleColors.WHITE_BOLD + "  5️⃣  Generate User Report" + ConsoleColors.RESET);
                                System.out.println(ConsoleColors.WHITE_BOLD + "  6️⃣  Logout" + ConsoleColors.RESET);
                                int moviechoice = readIntInRange(sc, ConsoleColors.CYAN_BOLD + "➤ Enter your choice: " + ConsoleColors.RESET, 1, 6);

                                if (moviechoice == 1) {
                                    System.out.println("Insert which entity?");
                                    System.out.println("1. Movie");
                                    System.out.println("2. Series");
                                    int typeChoice = readDigitsOnly(sc, "");
                                    sc.nextLine(); // clear newline

                                    try (Statement st = con.createStatement()) {
                                        if (typeChoice == 1) {
                                            String sql = readFullLine(sc, "Enter INSERT SQL for movie (e.g., INSERT INTO movie ...): ");
                                            int rows = executeDml(st, sql, "INSERT");
                                            if (rows >= 0) {
                                                System.out.println(ConsoleColors.GREEN_BOLD + "✅ Insert executed. Rows affected: " + rows + ConsoleColors.RESET);
                                            }
                                        } else if (typeChoice == 2) {
                                            String sql = readFullLine(sc, "Enter INSERT SQL for series (e.g., INSERT INTO series ...): ");
                                            int rows = executeDml(st, sql, "INSERT");
                                            if (rows >= 0) {
                                                System.out.println(ConsoleColors.GREEN_BOLD + "✅ Insert executed. Rows affected: " + rows + ConsoleColors.RESET);
                                            }
                                        } else {
                                            System.out.println(ConsoleColors.RED_BOLD + "Invalid entity choice." + ConsoleColors.RESET);
                                        }
                                    } catch (SQLException e) {
                                        System.out.println(ConsoleColors.RED_BOLD + "❌ Your query is wrong: " + e.getMessage() + ConsoleColors.RESET);
                                    }
                                } else if (moviechoice == 3) {
                                    System.out.println("Delete which entity?");
                                    System.out.println("1. Movie (by ID)");
                                    System.out.println("2. Series (by ID)");
                                    System.out.println("3. Enter your own DELETE query");
                                    int typeChoice = readDigitsOnly(sc, "");
                                    sc.nextLine();
                                    try {
                                        if (typeChoice == 1) {
                                            String a = "SELECT movie_id, movie_title FROM movie";
                                            try (Statement st = con.createStatement();
                                                 ResultSet rs = st.executeQuery(a)) {
                                                while (rs.next()) System.out.println(rs.getInt(1) + " " + rs.getString(2));
                                            }
                                            int movieIdToDelete = readDigitsOnly(sc, "Enter movie ID to delete: ");
                                            String deleteSQL = "{call deleteMovie(?)}";
                                            try  { CallableStatement cst = con.prepareCall(deleteSQL);
                                                cst.setInt(1, movieIdToDelete);
                                                int r = cst.executeUpdate();
                                                System.out.println((r > 0) ? ConsoleColors.GREEN_BOLD + "✅ Movie deleted." + ConsoleColors.RESET
                                                        : ConsoleColors.YELLOW_BOLD + "ℹ️ Movie ID not found." + ConsoleColors.RESET);
                                            } catch (SQLException e) {
                                                System.out.println(ConsoleColors.RED_BOLD + "❌ Your query is wrong: " + e.getMessage() + ConsoleColors.RESET);
                                            }

                                        } else if (typeChoice == 2) {
                                            String a = "SELECT  id, series_name FROM series_data";
                                            try (Statement st = con.createStatement(); ResultSet rs = st.executeQuery(a)) {
                                                while (rs.next()) System.out.println(rs.getInt(1) + " " + rs.getString(2));
                                            }
                                            int seriesIdToDelete = readDigitsOnly(sc, "Enter series ID to delete: ");
                                            String deleteSQL = "{call deleteSeries(?)}";
                                            try  { CallableStatement cst = con.prepareCall(deleteSQL);
                                                cst.setInt(1, seriesIdToDelete);
                                                int r = cst.executeUpdate();
                                            } catch (SQLException e) {
                                                System.out.println(ConsoleColors.RED_BOLD + "❌ Your query is wrong: " + e.getMessage() + ConsoleColors.RESET);
                                            }
                                            String deleteSQL1 = "{call deleteSeries1(?)}";
                                            try  { CallableStatement cst1 = con.prepareCall(deleteSQL1);
                                                cst1.setInt(1, seriesIdToDelete);
                                                int r1 = cst1.executeUpdate();
                                                System.out.println((r1 > 0) ? ConsoleColors.GREEN_BOLD + "✅ Series deleted." + ConsoleColors.RESET
                                                        : ConsoleColors.YELLOW_BOLD + "ℹ️ Series ID not found." + ConsoleColors.RESET);
                                            } catch (SQLException e) {
                                                System.out.println(ConsoleColors.RED_BOLD + "❌ Your query is wrong: " + e.getMessage() + ConsoleColors.RESET);
                                            }

                                        } else if (typeChoice == 3) {
                                            try (Statement st = con.createStatement()) {
                                                String rawSql = readFullLine(sc, ConsoleColors.YELLOW_BOLD + "Enter your DELETE SQL (example: DELETE FROM movie WHERE movie_id=5): " + ConsoleColors.RESET);
                                                int rows = executeDml(st, rawSql, "DELETE");
                                                if (rows >= 0) {
                                                    System.out.println(ConsoleColors.GREEN_BOLD + "✅ Delete executed. Rows affected: " + rows + ConsoleColors.RESET);
                                                }
                                            }
                                        } else {
                                            System.out.println(ConsoleColors.RED_BOLD + "Invalid entity choice." + ConsoleColors.RESET);
                                        }
                                    } catch (SQLException e) {
                                        System.out.println(ConsoleColors.RED_BOLD + "❌ Your query is wrong: " + e.getMessage() + ConsoleColors.RESET);
                                    }
                                } else if (moviechoice == 2) {
                                    System.out.println("Update which entity?");
                                    System.out.println("1. Movie (guided update)");
                                    System.out.println("2. Series (guided update)");
                                    System.out.println("3. Enter your own UPDATE query");
                                    int typeChoice = readDigitsOnly(sc, "");
                                    sc.nextLine(); // clear newline

                                    try {
                                        if (typeChoice == 1) {
                                            int movieIdToUpdate = readDigitsOnly(sc, "Enter movie ID to update: ");
                                            String newTitle = readFullLine(sc, "Enter new movie title: ");
                                            String updateSQL = "UPDATE movie SET movie_title = ? WHERE movie_id = ?";
                                            try (PreparedStatement pstmt = con.prepareStatement(updateSQL)) {
                                                pstmt.setString(1, newTitle);
                                                pstmt.setInt(2, movieIdToUpdate);
                                                int rows = pstmt.executeUpdate();
                                                System.out.println((rows > 0) ? ConsoleColors.GREEN_BOLD + "✅ Movie updated." + ConsoleColors.RESET
                                                        : ConsoleColors.YELLOW_BOLD + "ℹ️ Movie ID not found." + ConsoleColors.RESET);
                                            } catch (SQLException e) {
                                                System.out.println(ConsoleColors.RED_BOLD + "❌ Your query is wrong: " + e.getMessage() + ConsoleColors.RESET);
                                            }

                                        } else if (typeChoice == 2) {
                                            int seriesIdToUpdate = readDigitsOnly(sc, "Enter series ID to update: ");
                                            String newTitle = readFullLine(sc, "Enter new series title: ");
                                            String updateSQL = "UPDATE series SET title = ? WHERE id = ?";
                                            try (PreparedStatement pstmt = con.prepareStatement(updateSQL)) {
                                                pstmt.setString(1, newTitle);
                                                pstmt.setInt(2, seriesIdToUpdate);
                                                int rows = pstmt.executeUpdate();
                                                System.out.println((rows > 0) ? ConsoleColors.GREEN_BOLD + "✅ Series updated." + ConsoleColors.RESET
                                                        : ConsoleColors.YELLOW_BOLD + "ℹ️ Series ID not found." + ConsoleColors.RESET);
                                            } catch (SQLException e) {
                                                System.out.println(ConsoleColors.RED_BOLD + "❌ Your query is wrong: " + e.getMessage() + ConsoleColors.RESET);
                                            }
                                            String s = "call updateSeries(?,?)";
                                            try  {CallableStatement cst = con.prepareCall(s);
                                                cst.setString(1, newTitle);
                                                cst.setInt(2, seriesIdToUpdate);
                                                int rows = cst.executeUpdate();
                                                System.out.println((rows > 0) ? ConsoleColors.GREEN_BOLD + "✅ Series updated." + ConsoleColors.RESET
                                                        : ConsoleColors.YELLOW_BOLD + "ℹ️ Series ID not found." + ConsoleColors.RESET);
                                            } catch (SQLException e) {
                                                System.out.println(ConsoleColors.RED_BOLD + "❌ Your query is wrong: " + e.getMessage() + ConsoleColors.RESET);
                                            }

                                        } else if (typeChoice == 3) {
                                            try (Statement st = con.createStatement()) {
                                                String rawSql = readFullLine(sc, ConsoleColors.YELLOW_BOLD + "Enter your UPDATE SQL (example: UPDATE movie SET category='Action' WHERE movie_id=5): " + ConsoleColors.RESET);
                                                int rows = executeDml(st, rawSql, "UPDATE");
                                                if (rows >= 0) {
                                                    System.out.println(ConsoleColors.GREEN_BOLD + "✅ Update executed. Rows affected: " + rows + ConsoleColors.RESET);
                                                }
                                            }
                                        } else {
                                            System.out.println(ConsoleColors.RED_BOLD + "Invalid entity choice." + ConsoleColors.RESET);
                                        }
                                    } catch (SQLException e) {
                                        System.out.println(ConsoleColors.RED_BOLD + "❌ Your query is wrong: " + e.getMessage() + ConsoleColors.RESET);
                                    }
                                } else if (moviechoice == 4) {
                                    System.out.println("View which entity?");
                                    System.out.println("1. Movie");
                                    System.out.println("2. Series");
                                    int typeChoice = readDigitsOnly(sc, "");
                                    if (typeChoice == 1) {
                                        String fetchSQL = "SELECT * FROM movie";
                                        Statement stmt = con.createStatement();
                                        ResultSet rs = stmt.executeQuery(fetchSQL);

                                        System.out.println(ConsoleColors.GREEN_BOLD + "\n🎬 Movie List:" + ConsoleColors.RESET);
                                        System.out.println(ConsoleColors.CYAN_BOLD + "══════════════════════════════════════════════════════════════════════════════════════════════════════" + ConsoleColors.RESET);

                                        while (rs.next()) {
                                            int id = rs.getInt("movie_id");
                                            String title = rs.getString("movie_title");
                                            String lang = rs.getString("movie_language");
                                            String cat = rs.getString("category");
                                            String dur = rs.getString("duration");

                                            System.out.println(ConsoleColors.YELLOW_BOLD + "Movie ID   : " + ConsoleColors.WHITE_BOLD + id + ConsoleColors.RESET);
                                            System.out.println(ConsoleColors.YELLOW_BOLD + "Title      : " + ConsoleColors.WHITE_BOLD + title + ConsoleColors.RESET);
                                            System.out.println(ConsoleColors.YELLOW_BOLD + "Language   : " + ConsoleColors.WHITE_BOLD + lang + ConsoleColors.RESET);
                                            System.out.println(ConsoleColors.YELLOW_BOLD + "Category   : " + ConsoleColors.WHITE_BOLD + cat + ConsoleColors.RESET);
                                            System.out.println(ConsoleColors.YELLOW_BOLD + "Duration   : " + ConsoleColors.WHITE_BOLD + dur + ConsoleColors.RESET);
                                            System.out.println(ConsoleColors.CYAN_BOLD + "──────────────────────────────────────────────────────────────────────────────────────────────────" + ConsoleColors.RESET);
                                        }
                                    } else if (typeChoice == 2) {
                                        String s = "select * from series";
                                        Statement st = con.createStatement();
                                        ResultSet r = st.executeQuery(s);

                                        while (r.next()) {
                                            int id = r.getInt("id");
                                            String title = r.getString(2);
                                            Series s1 = new Series(id, title);
                                            int eid = r.getInt(3);
                                            String season = r.getString(4);
                                            int no = r.getInt(5);
                                            String path = r.getString(7);
                                            String dur = r.getString(8);
                                            Episode e = new Episode(id, season, title, no, path, dur);
                                        }

                                        List<String> seriesList = new ArrayList<>();
                                        String seriesSQL = "SELECT DISTINCT title FROM series";
                                        System.out.println(ConsoleColors.GREEN_BOLD + "\n📺 Available Series (Premium Access):" + ConsoleColors.RESET);

                                        Statement seriesStmt = con.createStatement();
                                        ResultSet seriesRS = seriesStmt.executeQuery(seriesSQL);

                                        int sIdx = 1;
                                        while (seriesRS.next()) {

                                            String title = seriesRS.getString("title");
                                            seriesList.add(title);
                                            System.out.println(ConsoleColors.YELLOW_BOLD + sIdx + ". " + ConsoleColors.WHITE_BOLD + title + ConsoleColors.RESET);
                                            sIdx++;
                                        }
                                        if (seriesList.isEmpty()) {
                                            System.out.println(ConsoleColors.RED_BOLD + "❌ No series available." + ConsoleColors.RESET);
                                            return;
                                        }


                                        int seriesChoice = readDigitsOnly(sc, ConsoleColors.BLUE_BOLD + "\n🎯 Enter the number of the series you want to watch: " + ConsoleColors.RESET);
                                        if (seriesChoice < 1 || seriesChoice > seriesList.size()) {
                                            System.out.println(ConsoleColors.RED_BOLD + "❌ Invalid series selection." + ConsoleColors.RESET);
                                            return;
                                        }
                                        String selectedSeries = seriesList.get(seriesChoice - 1);


                                        List<Integer> seasons = new ArrayList<>();
                                        String seasonSQL = "SELECT DISTINCT season FROM series WHERE title = ?";
                                        PreparedStatement seasonStmt = con.prepareStatement(seasonSQL);
                                        seasonStmt.setString(1, selectedSeries);
                                        ResultSet seasonRS = seasonStmt.executeQuery();

                                        System.out.println(ConsoleColors.GREEN_BOLD + "\n📺 Available Seasons for " + selectedSeries + ":" + ConsoleColors.RESET);
                                        int seasIdx = 1;
                                        while (seasonRS.next()) {
                                            int seasonNum = seasonRS.getInt("season");
                                            seasons.add(seasonNum);
                                            System.out.println(ConsoleColors.YELLOW_BOLD + seasIdx + ". " + ConsoleColors.WHITE_BOLD + "Season " + seasonNum + ConsoleColors.RESET);
                                            seasIdx++;
                                        }
                                        if (seasons.isEmpty()) {
                                            System.out.println(ConsoleColors.RED_BOLD + "❌ No seasons available for this series." + ConsoleColors.RESET);
                                            return;
                                        }

                                        System.out.print(ConsoleColors.BLUE_BOLD + "\n🎯 Enter the number of the season you want to watch: " + ConsoleColors.RESET);
                                        int seasonChoice = readDigitsOnly(sc, ConsoleColors.BLUE_BOLD + "\n➤ Enter your choice: " + ConsoleColors.RESET);
                                        if (seasonChoice < 1 || seasonChoice > seasons.size()) {
                                            System.out.println(ConsoleColors.RED_BOLD + "❌ Invalid season selection." + ConsoleColors.RESET);
                                            return;
                                        }
                                        int selectedSeason = seasons.get(seasonChoice - 1);

                                        Map<Integer, String> episodeMap = new HashMap<>();
                                        String episodeSQL = "SELECT * FROM series WHERE title = ? AND season = ? ORDER BY episodeNO";
                                        PreparedStatement episodeStmt = con.prepareStatement(episodeSQL);
                                        episodeStmt.setString(1, selectedSeries);
                                        episodeStmt.setInt(2, selectedSeason);
                                        ResultSet episodesRS = episodeStmt.executeQuery();

                                        System.out.println(ConsoleColors.GREEN_BOLD + "\n📺 Episodes in: " + ConsoleColors.YELLOW_BOLD + selectedSeries + ", Season " + selectedSeason + ConsoleColors.RESET);
                                        System.out.println(ConsoleColors.CYAN_BOLD + "══════════════════════════════════════════════════════════════════════════════════════════════════════" + ConsoleColors.RESET);
                                        while (episodesRS.next()) {
                                            int episodeID = episodesRS.getInt("episodeID");
                                            int episodeNo = episodesRS.getInt("episodeNO");
                                            String episodeName = episodesRS.getString("episode_name");
                                            String duration = episodesRS.getString("duration");
                                            int likes = episodesRS.getInt("lik");
                                            episodeMap.put(episodeID, episodeName);

                                            System.out.println(ConsoleColors.YELLOW_BOLD + "Episode ID   : " + ConsoleColors.WHITE_BOLD + episodeID + ConsoleColors.RESET);
                                            System.out.println(ConsoleColors.YELLOW_BOLD + "Episode No   : " + ConsoleColors.WHITE_BOLD + episodeNo + ConsoleColors.RESET);
                                            System.out.println(ConsoleColors.YELLOW_BOLD + "Name         : " + ConsoleColors.WHITE_BOLD + episodeName + ConsoleColors.RESET);
                                            System.out.println(ConsoleColors.YELLOW_BOLD + "path         : " + ConsoleColors.WHITE_BOLD + episodesRS.getString("video_path") + ConsoleColors.RESET);
                                            System.out.println(ConsoleColors.YELLOW_BOLD + "Duration     : " + ConsoleColors.WHITE_BOLD + duration + ConsoleColors.RESET);
                                            System.out.println(ConsoleColors.YELLOW_BOLD + "Likes        : " + ConsoleColors.WHITE_BOLD + likes + " ❤️" + ConsoleColors.RESET);
                                            System.out.println(ConsoleColors.CYAN_BOLD + "──────────────────────────────────────────────────────────────────────────────────────────────────" + ConsoleColors.RESET);
                                        }
                                        if (episodeMap.isEmpty()) {
                                            System.out.println(ConsoleColors.RED_BOLD + "❌ No episodes available for this season." + ConsoleColors.RESET);
                                            return;
                                        }
                                    } else {
                                        System.out.println("enter valid number");
                                    }


                                } else if (moviechoice == 6) {
                                    System.out.println(ConsoleColors.GREEN_BOLD + "\n👋 Logging out. See you soon!" + ConsoleColors.RESET);
                                    break;
                                } else if (moviechoice == 5) {
                                    String fetchUsers = "SELECT * FROM user";
                                    Statement userStmt = con.createStatement();
                                    ResultSet userRs = userStmt.executeQuery(fetchUsers);

                                    //  Write user data to file
                                    String filename = "user_report.txt";
                                    try {
                                        FileWriter fw = new FileWriter(filename);
                                        BufferedWriter bw = new BufferedWriter(fw);

                                        // Add headers
                                        bw.write("User ID | First Name | Middle Name | Last Name | Email | Password | Mobile No | Age | Subscription");
                                        bw.newLine();
                                        bw.write("----------------------------------------------------------------------------------------------");
                                        bw.newLine();

                                        while (userRs.next()) {
                                            long user_id = userRs.getLong("user_id");
                                            String fname = userRs.getString("first_name");
                                            String mname = userRs.getString("middle_name");
                                            String lname = userRs.getString("last_name");
                                            String email = userRs.getString("email");
                                            String password = userRs.getString("password");
                                            long mobile_no = userRs.getLong("mobile_no");
                                            int age = userRs.getInt("age");
                                            String subscription = userRs.getString("subscription");

                                            String row = user_id + " | " + fname + " | " + mname + " | " + lname + " | "
                                                    + email + " | " + password + " | " + mobile_no + " | " + age + " | " + subscription;
                                            bw.write(row);
                                            bw.newLine();
                                        }
                                        bw.flush();
                                        System.out.println(ConsoleColors.GREEN_BOLD + "✅ User report generated: " + filename + ConsoleColors.RESET);
                                    } catch (Exception ex) {
                                        System.out.println(ConsoleColors.RED_BOLD + "❌ Error generating user report: " + ex.getMessage() + ConsoleColors.RESET);
                                    }

                                    //reading data
                                    System.out.println(ConsoleColors.GREEN_BOLD + "\n📊 User Report Contents:" + ConsoleColors.RESET);
                                    System.out.println(ConsoleColors.CYAN_BOLD + "══════════════════════════════════════════════════════════════════════════════════════════════════════" + ConsoleColors.RESET);
                                    try {
                                        BufferedReader br = new BufferedReader(new FileReader(filename));
                                        String line = br.readLine();
                                        while (line != null) {
                                            System.out.println(line);
                                            line = br.readLine();
                                        }
                                    } catch (Exception e) {
                                        System.out.println(ConsoleColors.RED_BOLD + "❌ Error reading user report: " + e.getMessage() + ConsoleColors.RESET);
                                    }
                                }
                            }
                            found = true;
                            break;
                        }
                    }

                    if (!found) {
                        System.out.println(ConsoleColors.RED_BOLD + "❌ Invalid credentials or OTP!" + ConsoleColors.RESET);
                    }
                } else if (A_choice == 3) {
                    System.out.println(ConsoleColors.GREEN_BOLD + "\n👋 Returning to main menu..." + ConsoleColors.RESET);
                    break;
                } else {
                    System.out.println(ConsoleColors.RED_BOLD + "❌ Invalid choice. Try again." + ConsoleColors.RESET);
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private static String readFullLine(Scanner sc, String prompt) {
        System.out.print(prompt);
        String line = sc.nextLine();
        if (line.isEmpty()) { // handle leftover newline from previous next/nextInt
            line = sc.nextLine();
        }
        return line.trim();
    }

    // Executes a DML statement with type guard; returns affected row count or -1 if failed
    private static int executeDml(Statement st, String sql, String requiredPrefixUpper) {
        String norm = sql.trim();
        if (!norm.toUpperCase().startsWith(requiredPrefixUpper)) {
            System.out.println(ConsoleColors.RED_BOLD + "❌ Only " + requiredPrefixUpper + " statements are allowed here." + ConsoleColors.RESET);
            return -1;
        }
        try {
            return st.executeUpdate(norm);
        } catch (SQLException e) {
            System.out.println(ConsoleColors.RED_BOLD + "❌ Your query is wrong: " + e.getMessage() + ConsoleColors.RESET);
            return -1;
        }
    }



    // Allow only letters and spaces (no digits or special characters)
    private static boolean isValidName(String s) {
        return s != null && s.matches("[A-Za-z ]+");
    }

    // Prompt loop that enforces the rule and supports spaces in names
    private static String readValidName(Scanner sc, String prompt) {
        while (true) {
            System.out.print(prompt);
            String in = sc.next().trim();
            if (in.isEmpty()) {
                System.out.println(ConsoleColors.RED_BOLD + "❌ Name cannot be empty." + ConsoleColors.RESET);
                continue;
            }
            if (!isValidName(in)) {
                System.out.println(ConsoleColors.RED_BOLD + "❌ Invalid name. Use letters and spaces only (no digits/special chars)." + ConsoleColors.RESET);
                continue;
            }
            return in;
        }
    }

    private static int readIntInRange(Scanner sc, String s, int min, int max) {
        while (true) {
            System.out.print(s);
            String line = sc.next().trim();


            // Check digits only (handles negative if needed; here only non-negative menu choices)
            if (!line.matches("\\d+")) {
                System.out.println(ConsoleColors.RED_BOLD + "❌ Please enter digits only." + ConsoleColors.RESET);
                continue;
            }

            try {
                int val = Integer.parseInt(line);
                if (val < min || val > max) {
                    System.out.println(ConsoleColors.RED_BOLD + "❌ Enter a number between " + min + " and " + max + "." + ConsoleColors.RESET);
                    continue;
                }
                return val;
            } catch (NumberFormatException e) {
                System.out.println(ConsoleColors.RED_BOLD + "❌ Invalid number." + ConsoleColors.RESET);
            }
        }
    }


    static int readDigitsOnly(Scanner sc, String s) {
        while (true) {
            System.out.print(s);
            String line = sc.next().trim();

            if (!line.matches("\\d+")) {
                System.out.println(ConsoleColors.RED_BOLD + "❌ Please enter digits only." + ConsoleColors.RESET);
                continue;
            }

            try {
                return Integer.parseInt(line);
            } catch (NumberFormatException ex) {
                // Very large numbers can overflow int
                System.out.println(ConsoleColors.RED_BOLD + "❌ Number too large." + ConsoleColors.RESET);
            }
        }
    }

    static long readLongDigitsOnly(Scanner sc, String prompt) {
        while (true) {
            System.out.print(prompt);
            String line = sc.next().trim();
           /* if (line.isEmpty()) {
                continue; // if a stray newline was in the buffer, this will spin once without re-printing elsewhere
            }*/
            if (!line.matches("\\d+")) {
                System.out.println(ConsoleColors.RED_BOLD + "❌ Please enter digits only." + ConsoleColors.RESET);
                continue;
            }
            try {
                return Long.parseLong(line);
            } catch (NumberFormatException ex) {
                System.out.println(ConsoleColors.RED_BOLD + "❌ Number too large for long." + ConsoleColors.RESET);
            }
        }
    }

    private static boolean readYesNo(Scanner sc, String s) {
        while (true) {
            System.out.print(s);
            String ans = sc.next().trim();
            if (ans.equalsIgnoreCase("yes")) {
                return true;
            } else if (ans.equalsIgnoreCase("no")) {
                return false;
            } else {
                System.out.println(ConsoleColors.RED_BOLD + "❌ Invalid input. Write only Yes or No." + ConsoleColors.RESET);
            }
        }
    }
}
package Java_topic;

class user {
    long user_id;
    String first_name;
    String middle_name;
    String last_name;
    String email;
    String password;
    Long mobile_no;
    int age;
    String sub;

    public user(long user_id, String first_name, String middle_name, String last_name, String email, String password, long mobile_no, int age,String sub) {
        this.user_id = user_id;
        this.first_name = first_name;
        this.middle_name = middle_name;
        this.last_name = last_name;
        this.email = email;
        this.password = password;
        this.mobile_no = mobile_no;
        this.age = age;
        this.sub=sub;
    }



    public String getFirst_name() {
        return first_name;
    }


    public String getEmail() {
        return email;
    }


    public String getPassword() {
        return password;
    }

    @Override
    public String toString() {
        return "user_id=" + user_id +
                ", first_name='" + first_name + '\'' +
                ", middle_name='" + middle_name + '\'' +
                ", last_name='" + last_name + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", mobile_no=" + mobile_no
                ;
    }
}
package Java_topic;

class Admin {
    long admin_id;
    String admin_name;
    String email;
    String admin_password;

    public Admin(long admin_id, String admin_name, String email, String admin_password) {
        this.admin_id = admin_id;
        this.admin_name = admin_name;
        this.email = email;
        this.admin_password = admin_password;
    }


    public String getEmail() {
        return email;
    }


    public String getAdmin_password() {
        return admin_password;
    }


    @Override
    public String toString() {
        return "Admin{" +
                "admin_id=" + admin_id +
                ", admin_name='" + admin_name + '\'' +
                ", email='" + email + '\'' +
                ", admin_password='" + admin_password + '\'' +
                '}';
    }
}
package Java_topic;

class Episode {
    int episodeId;
    String season;
    String title;
    int episodeNo;
    String videoPath, duration;

    Episode(int episodeId, String season, String title, int episodeNo, String videoPath, String duration) {
        this.episodeId = episodeId;
        this.season=season;
        this.title = title;
        this.episodeNo = episodeNo;
        this.videoPath = videoPath;
        this.duration = duration;
    }

    @Override
    public String toString() {
        return "Episode{" +
                "episodeId=" + episodeId +
                ", title='" + title + '\'' +
                ", episodeNo=" + episodeNo +
                ", videoPath='" + videoPath + '\'' +
                ", duration='" + duration + '\'' +
                '}';
    }
}
package Java_topic;

class Movie {
    int movieId;
    String  title, language, category;
    int likes = 0;
    String videoPath;
    String duration;

    public Movie(int movieId, String title, String language, String category, String videoPath, String duration, int likes) {
        this.movieId = movieId;
        this.title = title;
        this.language = language;
        this.category = category;
        this.videoPath = videoPath;
        this.duration = duration;
        this.likes = likes;
    }

    @Override
    public String toString() {
        return "Movie{" +
                "movieId=" + movieId +
                ", title='" + title + '\'' +
                ", language='" + language + '\'' +
                ", category='" + category + '\'' +
                ", likes=" + likes +
                ", videoPath='" + videoPath + '\'' +
                ", duration='" + duration + '\'' +
                '}';
    }
}
package Java_topic;

class Series {
    int seriesId;
    String title;

    Series(int seriesId, String title) {
        this.seriesId = seriesId;
        this.title = title;
    }

    @Override
    public String toString() {
        return "Series{" +
                "seriesId=" + seriesId +
                ", title='" + title + '\'' +
                '}';
    }
}

package Java_topic;// Main.java (strictly all abstract)
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

public abstract class Main {
    protected abstract void initSchema(Connection con) throws SQLException;
    protected abstract void runMenuLoop(Connection con, HashMap<Long, user> hm,HashMap<Long, Admin> hmu,OTT_PLATFORM ott) throws SQLException, InterruptedException;
}

package Java_topic;

 class Histrory {
    int history_id;
    String date;
    String time;
    long userid;
    String content;

    public Histrory(int history_id, String date, String time, long userid, String content) {
        this.history_id = history_id;
        this.date = date;
        this.time = time;
        this.userid = userid;
        this.content = content;
    }

    @Override
    public String toString() {
        return "Histrory{" +
                "history_id=" + history_id +
                ", date='" + date + '\'' +
                ", time='" + time + '\'' +
                ", userid=" + userid +
                ", content='" + content + '\'' +
                '}';
    }
}
package Java_topic;

public class Subscription {
    int subId;
    Long userId;
    String planType;
    String startDate, endDate;

    Subscription(int subId, long userId, String planType, String startDate, String endDate) {
        this.subId = subId;
        this.userId = userId;
        this.planType = planType;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    @Override
    public String toString() {
        return "Subscription{" +
                "subId=" + subId +
                ", userId=" + userId +
                ", planType='" + planType + '\'' +
                ", startDate='" + startDate + '\'' +
                ", endDate='" + endDate + '\'' +
                '}';
    }
}
package Java_topic;

public class ConsoleColors{
    // Reset
    public static final String RESET = "\033[0m";  // Text Reset


    public static final String BLACK_BOLD = "\033[1;30m";
    public static final String RED_BOLD = "\033[1;31m";
    public static final String GREEN_BOLD = "\033[1;32m";
    public static final String YELLOW_BOLD = "\033[1;33m";
    public static final String BLUE_BOLD = "\033[1;34m";
    public static final String PURPLE_BOLD = "\033[1;35m";
    public static final String CYAN_BOLD = "\033[1;36m";
    public static final String WHITE_BOLD = "\033[1;37m";

}

package DS_topic;

import Java_topic.ConsoleColors;

public class BST {
    BSTNode root;

    public void insert(int likeCount, String title, String type) {
        root = insertRec(root, likeCount, title, type);
    }

    private BSTNode insertRec(BSTNode root, int likeCount, String title, String type) {
        if (root == null) return new BSTNode(likeCount, title, type);
        if (likeCount < root.likeCount)
            root.left = insertRec(root.left, likeCount, title, type);
        else
            root.right = insertRec(root.right, likeCount, title, type);
        return root;
    }

    public void printDescending() {
        System.out.println(ConsoleColors.GREEN_BOLD + "\n🏆 Top Rated Content Rankings:" + ConsoleColors.RESET);
        System.out.println(ConsoleColors.CYAN_BOLD + "══════════════════════════════════════════════════════════════════════════════════════════════════════" + ConsoleColors.RESET);
        printDescendingRec(root);
        System.out.println(ConsoleColors.CYAN_BOLD + "══════════════════════════════════════════════════════════════════════════════════════════════════════" + ConsoleColors.RESET);
    }

    private void printDescendingRec(BSTNode root) {
        if (root != null) {
            printDescendingRec(root.right);
            String typeIcon = root.type.equals("Movie") ? "🎬" : "📺";
            String likeIcon = "❤️";
            System.out.println(ConsoleColors.YELLOW_BOLD + typeIcon + " " + ConsoleColors.WHITE_BOLD + root.title + ConsoleColors.RESET +
                    ConsoleColors.CYAN_BOLD + " | " + ConsoleColors.RESET +
                    ConsoleColors.RED_BOLD + likeIcon + " " + root.likeCount + " likes" + ConsoleColors.RESET +
                    ConsoleColors.CYAN_BOLD + " | " + ConsoleColors.RESET +
                    ConsoleColors.GREEN_BOLD + "Type: " + root.type + ConsoleColors.RESET);
            printDescendingRec(root.left);
        }
    }
}
package DS_topic;

class BSTNode {
    int likeCount;
    String title;
    String type; // "Movie" or "Series"
    BSTNode left, right;

    public BSTNode(int likeCount, String title, String type) {
        this.likeCount = likeCount;
        this.title = title;
        this.type = type;
        this.left = this.right = null;
    }
}

