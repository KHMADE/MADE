package receipt.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;

import receipt.model.dao.ReceiptDao;
import receipt.model.vo.Receipt;

public class ReceiptService {

	public Receipt selectDesignReceipt(String orderCode) {

		Connection conn = getConnection();
		
		Receipt reciept = new ReceiptDao().selectDesignReceipt(conn, orderCode);
		
		close(conn);
		
		return reciept;
	}
	
	public Receipt selectPartReceipt(String orderCode) {

		Connection conn = getConnection();
		
		Receipt reciept = new ReceiptDao().selectPartReceipt(conn, orderCode);
		
		close(conn);
		
		return reciept;
	}

}
