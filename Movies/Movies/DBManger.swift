//
//  DBManger.swift
//  Movies
//
//  Created by Karam Ibrahim on 4/20/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//
import Foundation
import SQLite3

class DBManager{
    
    static let dbManger = DBManager()
     let dbPath:String?
     var db: OpaquePointer?
    
    private init(){
        dbPath = "movies.sqlite"
       db = openDatabase()
    }
    
    deinit {
      sqlite3_close(db)
    }
    
    func openDatabase() -> OpaquePointer? {
        let fileURL : URL? = try! FileManager.default.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent(dbPath!)

        let part1DbPath = fileURL?.path
        guard dbPath != nil else {
        return nil
      }
      if sqlite3_open(part1DbPath, &db) == SQLITE_OK {
        return db
      } else {
       return nil
      }
    }
    
    func createTablecreateTableString(createTableString :String) {
      // 1
      var createTableStatement: OpaquePointer?
      // 2
      if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) ==
          SQLITE_OK {
        // 3
        if sqlite3_step(createTableStatement) == SQLITE_DONE {
          print("\nMovie table created.")
        } else {
          print("\nMovie table is not created.")
        }
      } else {
        print("\nCREATE TABLE statement is not prepared.")
      }
      // 4
      sqlite3_finalize(createTableStatement)
    }
    
    
    
    func query(queryStatementString:String)->[Movie] {
      var queryStatement: OpaquePointer?
        var movies :[Movie] = []
      // 1
      if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) ==
          SQLITE_OK {
        // 2
        while sqlite3_step(queryStatement) == SQLITE_ROW {
            
            let movie = Movie()
            let title = String(cString: sqlite3_column_text(queryStatement, 0))
            let image = String(cString: sqlite3_column_text(queryStatement,1))
           let rating = sqlite3_column_double(queryStatement,2)
           let releseYear = sqlite3_column_int(queryStatement,3)
          let genre = String(cString: sqlite3_column_text(queryStatement,4))
                movie.title = title
                movie.image = image
                movie.rating  = Float(rating)
                movie.releseYear = Int(releseYear)
                movie.genre = [genre]
                movies.append(movie)
       
        }
      } else{
          // 6
        let errorMessage = String(cString: sqlite3_errmsg(db))
        print("\nQuery is not prepared \(errorMessage)")
      }
      // 7
      sqlite3_finalize(queryStatement)
        return movies
    }


    func insert( insertStatementString:String, movie :Movie) {
      var insertStatement: OpaquePointer?
      // 1
      if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) ==
          SQLITE_OK {
        let title:  NSString = movie.title as NSString
        let image: NSString = movie.image as NSString
        let rating :Double = Double(movie.rating)
        let genre :NSString = movie.genre.joined() as NSString
        let releseYear :Int32 = Int32(movie.releseYear)
        // 2
       sqlite3_bind_text(insertStatement, 1, title.utf8String, -1, nil)
        sqlite3_bind_text(insertStatement, 2, image.utf8String, -1, nil)
         sqlite3_bind_double(insertStatement,3,rating )
        sqlite3_bind_text(insertStatement, 4, genre.utf8String, -1, nil)
        sqlite3_bind_int(insertStatement, 5, releseYear)
        // 3
        if sqlite3_step(insertStatement) == SQLITE_DONE {
          print("\nSuccessfully inserted row.")
        } else {
          print("\nCould not insert row.")
        }
      } else {
        print("\nINSERT statement is not prepared.")
      }
      // 5
      sqlite3_finalize(insertStatement)
    }
    

    func delete(deleteStatementString:String, movie:Movie) {
      var deleteStatement: OpaquePointer?
      if sqlite3_prepare_v2(db, deleteStatementString, -1, &deleteStatement, nil) ==
          SQLITE_OK {
        sqlite3_bind_text(deleteStatement, 1, movie.title,-1,nil)
        if sqlite3_step(deleteStatement) == SQLITE_DONE {
          print("\nSuccessfully deleted row.")
        } else {
          print("\nCould not delete row.")
        }
      } else {
        print("\nDELETE statement could not be prepared")
      }
      
      sqlite3_finalize(deleteStatement)
    }
}
