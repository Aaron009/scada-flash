package com.bitcrew.utills
{
	import flash.display.Sprite;
	import flash.events.SQLErrorEvent;
	import flash.events.SQLEvent;
	import flash.filesystem.File;
	import flash.data.SQLConnection;
	import flash.data.SQLResult;
	import flash.data.SQLStatement;
	
	/**
	 * ...
	 * @author ...
	 */
	public class sqlliteConfig extends Sprite
	{
		
		public function sqlliteConfig()
		{
			//();
			//initSqlite(null,null);
		}
		
		private var _receiptNullFunction:Function;
		private var _receiptConfigFunction:Function;
		//private var _receiptTrueFunction:Function;
		
		public function initSqlite(receipt:Function, config:Function):void
		{
			_receiptNullFunction = receipt;
			_receiptConfigFunction = config;
			//_receiptTrueFunction = exist;
			startSqlite();
		}
		
		private var conn:SQLConnection;
		private var createStmt:SQLStatement;
		private var insertStmt:SQLStatement;
		private var insertStmt2:SQLStatement;
		private var selectStmt:SQLStatement;
		
		private var insert1Complete:Boolean = false;
		private var insert2Complete:Boolean = false;
		
		public function startSqlite():void
		{
			conn = new SQLConnection();
			conn.addEventListener(SQLEvent.OPEN, openSuccess);
			conn.addEventListener(SQLErrorEvent.ERROR, openFailure);
			
			var dbFile:File = File.applicationDirectory.resolvePath("DB.db");
			conn.openAsync(dbFile);
		}
		
		private function openFailure(e:SQLErrorEvent):void
		{
			conn.removeEventListener(SQLEvent.OPEN, openSuccess);
			conn.removeEventListener(SQLErrorEvent.ERROR, openFailure);
			
			trace("event.error.message:", e.error.message);
			trace("event.error.details:", e.error.details);
			trace("打开数据库失败");
		}
		
		private function openSuccess(e:SQLEvent):void
		{
			conn.removeEventListener(SQLEvent.OPEN, openSuccess);
			conn.removeEventListener(SQLErrorEvent.ERROR, openFailure);
			createTable();
		}
		
		private function createTable():void
		{
			createStmt = new SQLStatement();
			
			createStmt.sqlConnection = conn;
			var sql:String = "";
			sql += "CREATE TABLE IF NOT EXISTS employees (";
			sql += "	empId		INTEGER PRIMARY KEY AUTOINCREMENT,";
			//sql += "	workCellID	TEXT,";
			sql += "	workCellID	TEXT";
			//sql += "	lastName	TEXT,";
			//sql += "	salary		NUMERIC CHECK (salary >= 0) DEFAULT 0";
			sql += ")";
			createStmt.text = sql;
			createStmt.addEventListener(SQLEvent.RESULT, createResult);
			createStmt.addEventListener(SQLErrorEvent.ERROR, createError);
			createStmt.execute();
		}
		
		private function createResult(event:SQLEvent):void
		{
			createStmt.removeEventListener(SQLEvent.RESULT, createResult);
			createStmt.removeEventListener(SQLErrorEvent.ERROR, createError);
			
			//addData();
			check()
		}
		
		
		private var checkResultBool:Boolean;
		private function check():void
		{
			var tempStmt:SQLStatement = new SQLStatement();
			tempStmt.sqlConnection = conn;
			//var sql:String = "select * from employees where workCellID ='Bob'";
			var sql:String = "select * from employees";
			//trace(sql)
			tempStmt.text = sql;
			
			tempStmt.addEventListener(SQLEvent.RESULT, tempselectResult);
			tempStmt.addEventListener(SQLErrorEvent.ERROR, tempselectError);
			
			tempStmt.execute();
		}
		
		private function tempselectResult(e:SQLEvent):void
		{
			var stmt:SQLStatement = e.target as SQLStatement;
			stmt.removeEventListener(SQLEvent.RESULT, insertResult);
			stmt.removeEventListener(SQLErrorEvent.ERROR, insertError);
			var result:SQLResult = stmt.getResult();
			//trace(result.data)
			
			if (result.data == null)
			{
				_receiptNullFunction();  // 无配置执行默认路径
				checkResultBool = false;
			}
			else
			{
				loadConfigData();
				checkResultBool = true;
			}
		}
		
		public function addOrUpdate(setIp:String):void
		{
			if (checkResultBool)
			{
				upData(setIp);
			}else
			{
				addData(setIp);
			}
		}
		
		private function upData(setIp:String):void
		{
			var tempSql = new SQLStatement();
			tempSql.sqlConnection = conn;
			var sql:String = "";
			sql += "UPDATE employees set workCellID = '";
			sql += setIp;
			sql += "' where empId =";
			sql += dataId;
			tempSql.text = sql;
			
			tempSql.addEventListener(SQLEvent.RESULT, tempupDataResult);
			tempSql.addEventListener(SQLErrorEvent.ERROR, tempupDataError);
			tempSql.execute();
		}
		
		private function tempupDataResult(e:SQLEvent):void
		{
			var stmt:SQLStatement = e.target as SQLStatement;
			stmt.removeEventListener(SQLEvent.RESULT, tempupDataResult);
			stmt.removeEventListener(SQLErrorEvent.ERROR, tempupDataError);
		}
		
		private function tempupDataError(e:SQLErrorEvent):void
		{
			var stmt:SQLStatement = e.target as SQLStatement;
			stmt.removeEventListener(SQLEvent.RESULT, tempupDataResult);
			stmt.removeEventListener(SQLErrorEvent.ERROR, tempupDataError);
		}
		
		
		
		
		private function loadConfigData():void
		{
			getData();
			
		}
		
		private function tempselectError(event:SQLErrorEvent):void
		{
			//status.text = "Error loading data";
			var stmt:SQLStatement = event.target as SQLStatement;
			stmt.removeEventListener(SQLEvent.RESULT, insertResult);
			stmt.removeEventListener(SQLErrorEvent.ERROR, insertError);
			
			trace("SELECT error:", event.error);
			trace("event.error.message:", event.error.message);
			trace("event.error.details:", event.error.details);
		}
		
		private function createError(event:SQLErrorEvent):void
		{
			createStmt.removeEventListener(SQLEvent.RESULT, createResult);
			createStmt.removeEventListener(SQLErrorEvent.ERROR, createError);
			
			trace("CREATE TABLE error:", event.error);
			trace("event.error.message:", event.error.message);
			trace("event.error.details:", event.error.details);
		}
		
		private function addData(setIp:String):void
		{
			insertStmt = new SQLStatement();
			insertStmt.sqlConnection = conn;
			var sql:String = "";
			sql += "INSERT INTO employees (workCellID) ";
			//sql += "VALUES ('Bob', 'Smith', 8000)";
			sql += "VALUES ('";
			sql += setIp;
			sql += "')";
			//trace(sql);
			insertStmt.text = sql;
			
			insertStmt.addEventListener(SQLEvent.RESULT, insertResult);
			insertStmt.addEventListener(SQLErrorEvent.ERROR, insertError);
			
			insertStmt.execute();
			
			checkResultBool = true;
			
			//insertStmt2 = new SQLStatement();
			//insertStmt2.sqlConnection = conn;
			//var sql2:String = "";
			//sql2 += "INSERT INTO employees (firstName, lastName, salary) ";
			//sql2 += "VALUES ('John', 'Jones', 8200)";
			//insertStmt2.text = sql2;
			//
			//insertStmt2.addEventListener(SQLEvent.RESULT, insertResult);
			//insertStmt2.addEventListener(SQLErrorEvent.ERROR, insertError);
			//
			//insertStmt2.execute();
		}
		
		private function insertResult(event:SQLEvent):void
		{
			var stmt:SQLStatement = event.target as SQLStatement;
			stmt.removeEventListener(SQLEvent.RESULT, insertResult);
			stmt.removeEventListener(SQLErrorEvent.ERROR, insertError);
			
			//if (stmt == insertStmt)
			//{
				//insert1Complete = true;
			//}
			//else
			//{
				//insert2Complete = true;
			//}
			//
			//if (insert1Complete && insert2Complete)
			//{
				//status.text = "Ready to load data";
			//}
		}
		
		function insertError(event:SQLErrorEvent):void
		{
			//status.text = "Error inserting data";
			
			insertStmt.removeEventListener(SQLEvent.RESULT, insertResult);
			insertStmt.removeEventListener(SQLErrorEvent.ERROR, insertError);
			
			trace("INSERT error:", event.error);
			trace("event.error.message:", event.error.message);
			trace("event.error.details:", event.error.details);
		}
		
		function getData():void
		{
			selectStmt = new SQLStatement();
			selectStmt.sqlConnection = conn;
			var sql:String = "SELECT * FROM employees";
			selectStmt.text = sql;
			
			selectStmt.addEventListener(SQLEvent.RESULT, selectResult);
			selectStmt.addEventListener(SQLErrorEvent.ERROR, selectError);
			
			selectStmt.execute();
		}
		
		private var dataId:uint;
		function selectResult(event:SQLEvent):void
		{
			//status.text = "Data loaded";
			
			selectStmt.removeEventListener(SQLEvent.RESULT, selectResult);
			selectStmt.removeEventListener(SQLErrorEvent.ERROR, selectError);
			
			var result:SQLResult = selectStmt.getResult();
			
			//resultsGrid.dataProvider = new DataProvider(result.data);
			var str:String;
			//var numRows:int = result.data.length;
			//for (var i:int = 0; i < numRows; i++)
			//{
				//var output:String = "";
				//for (var prop:String in result.data[i])
				//{
					//output += prop + ": " + result.data[i][prop] + "; ";
				//}
			//}
			dataId = uint(result.data[0]['empId']);
			_receiptConfigFunction(result.data[0]['workCellID']); // 软件配置默认路径 workCellID workCellID
			
			//_receiptTrueFunction();
		}
		
		function selectError(event:SQLErrorEvent):void
		{
			//status.text = "Error loading data";
			
			selectStmt.removeEventListener(SQLEvent.RESULT, selectResult);
			selectStmt.removeEventListener(SQLErrorEvent.ERROR, selectError);
			
			trace("SELECT error:", event.error);
			trace("event.error.message:", event.error.message);
			trace("event.error.details:", event.error.details);
		}
		
		private static var _instance:sqlliteConfig;
		public static function get instance():sqlliteConfig
		{
			if (!_instance)
				_instance = new sqlliteConfig();
			return _instance;
		}
	
	}

}