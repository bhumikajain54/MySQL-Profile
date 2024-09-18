create database sanitaryware1;
use sanitaryware1;


-- Create the User table
CREATE TABLE User (
    userId INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    password VARCHAR(100),
    role VARCHAR(50),
    addressId INT,
    FOREIGN KEY (addressId) REFERENCES Address(addressId)
);

-- Create the Address table
CREATE TABLE Address (
    addressId INT PRIMARY KEY,
    street VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    zipCode VARCHAR(10)
);

-- Create the Product table
CREATE TABLE Product (
    productId INT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT,
    price DECIMAL(10, 2),
    stock INT,
    categoryId INT
);

-- Create the Category table
CREATE TABLE Category (
    categoryId INT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT
);

-- Create the Order table
CREATE TABLE `Order` (
    orderId INT PRIMARY KEY,
    userId INT,
    orderDate DATE,
    status VARCHAR(50),
    totalAmount DECIMAL(10, 2),
    FOREIGN KEY (userId) REFERENCES User(userId)
);

-- Create the OrderItem table
CREATE TABLE OrderItem (
    orderItemId INT PRIMARY KEY,
    orderId INT,
    productId INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (orderId) REFERENCES `Order`(orderId),
    FOREIGN KEY (productId) REFERENCES Product(productId)
);

-- Create the ShoppingCart table
CREATE TABLE ShoppingCart (
    cartId INT PRIMARY KEY,
    userId INT,
    FOREIGN KEY (userId) REFERENCES User(userId)
);

-- Create the CartItem table
CREATE TABLE CartItem (
    cartItemId INT PRIMARY KEY,
    cartId INT,
    productId INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (cartId) REFERENCES ShoppingCart(cartId),
    FOREIGN KEY (productId) REFERENCES Product(productId)
);

-- Create the Payment table
CREATE TABLE Payment (
    paymentId INT PRIMARY KEY,
    orderId INT,
    paymentDate DATE,
    paymentMethod VARCHAR(50),
    amount DECIMAL(10, 2),
    paymentStatus VARCHAR(50),
    FOREIGN KEY (orderId) REFERENCES `Order`(orderId)
);



CREATE TABLE Shipment (
    shipmentId INT PRIMARY KEY,
    orderId INT,
    shipmentDate DATE,
    carrier VARCHAR(100),
    trackingNumber VARCHAR(100),
    status VARCHAR(50),
    FOREIGN KEY (orderId) REFERENCES `Order`(orderId)
);
CREATE TABLE Supplier (
    supplierId INT PRIMARY KEY,
    name VARCHAR(100),
    contactName VARCHAR(100),
    phone VARCHAR(50),
    email VARCHAR(100),
    addressId INT,
    FOREIGN KEY (addressId) REFERENCES Address(addressId)
);

CREATE TABLE ProductSupplier (
    productSupplierId INT PRIMARY KEY,
    productId INT,
    supplierId INT,
    price DECIMAL(10, 2),
    quantity INT,
    FOREIGN KEY (productId) REFERENCES Product(productId),
    FOREIGN KEY (supplierId) REFERENCES Supplier(supplierId)
);
CREATE TABLE ProductReview (
    reviewId INT PRIMARY KEY,
    productId INT,
    userId INT,
    rating INT,
    comment TEXT,
    reviewDate DATE,
    helpfulCount INT DEFAULT 0,
    FOREIGN KEY (productId) REFERENCES Product(productId),
    FOREIGN KEY (userId) REFERENCES User(userId)
);
CREATE TABLE PaymentGateway (
    gatewayId INT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT,
    transactionFee DECIMAL(5, 2),
    status VARCHAR(50)  -- 'Active', 'Inactive'
);
CREATE TABLE BundleDiscount (
    bundleDiscountId INT PRIMARY KEY,
    bundleId INT,
    discountId INT,
    FOREIGN KEY (bundleId) REFERENCES ProductBundle(bundleId),
    FOREIGN KEY (discountId) REFERENCES Discount(discountId)
);
CREATE TABLE StoreLocator (
    storeId INT PRIMARY KEY,
    storeName VARCHAR(100),
    address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    zipCode VARCHAR(10),
    country VARCHAR(100),
    phoneNumber VARCHAR(20),
    openingHours VARCHAR(100)
);
CREATE TABLE CustomerFeedback (
    feedbackId INT PRIMARY KEY,
    userId INT,
    feedbackText TEXT,
    feedbackDate DATE,
    responseText TEXT,
    responseDate DATE,
    status VARCHAR(50),  -- 'Open', 'Responded', 'Closed'
    FOREIGN KEY (userId) REFERENCES User(userId)
);
CREATE TABLE SalesTax (
    taxId INT PRIMARY KEY,
    region VARCHAR(100),
    taxRate DECIMAL(5, 2),
    applicableTo VARCHAR(100)  -- 'All Products', 'Specific Categories', etc.
);
CREATE TABLE CampaignMetrics (
    metricId INT PRIMARY KEY,
    campaignId INT,
    impressions INT,
    clicks INT,
    conversions INT,
    revenueGenerated DECIMAL(10, 2),
    FOREIGN KEY (campaignId) REFERENCES MarketingCampaign(campaignId)
);
CREATE TABLE UserActivityLog (
    activityLogId INT PRIMARY KEY,
    userId INT,
    activity VARCHAR(255),
    activityDate DATE,
    FOREIGN KEY (userId) REFERENCES User(userId)
);
CREATE TABLE InventoryRestock (
    restockId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    restockDate DATE NOT NULL,
    quantity INT NOT NULL,
    cost DECIMAL(10, 2),
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE ProductBundle (
    bundleId INT AUTO_INCREMENT PRIMARY KEY,
    bundleName VARCHAR(100) NOT NULL,
    bundleDescription TEXT,
    bundlePrice DECIMAL(10, 2) NOT NULL
);
CREATE TABLE BundleItem (
    bundleItemId INT AUTO_INCREMENT PRIMARY KEY,
    bundleId INT NOT NULL,
    productId INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (bundleId) REFERENCES ProductBundle(bundleId),
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE Discount (
    discountId INT AUTO_INCREMENT PRIMARY KEY,
    discountCode VARCHAR(50) NOT NULL,
    discountType VARCHAR(50) NOT NULL,  -- e.g., 'Percentage', 'Fixed Amount'
    discountValue DECIMAL(5, 2) NOT NULL,
    validFrom DATE NOT NULL,
    validTo DATE NOT NULL
);
CREATE TABLE MarketingCampaign (
    campaignId INT AUTO_INCREMENT PRIMARY KEY,
    campaignName VARCHAR(100) NOT NULL,
    startDate DATE NOT NULL,
    endDate DATE NOT NULL,
    budget DECIMAL(10, 2),
    campaignType VARCHAR(50)  -- e.g., 'Email', 'Social Media'
);
CREATE TABLE CampaignDiscount (
    campaignDiscountId INT AUTO_INCREMENT PRIMARY KEY,
    campaignId INT NOT NULL,
    discountId INT NOT NULL,
    FOREIGN KEY (campaignId) REFERENCES MarketingCampaign(campaignId),
    FOREIGN KEY (discountId) REFERENCES Discount(discountId)
);
CREATE TABLE ProductTag (
    tagId INT AUTO_INCREMENT PRIMARY KEY,
    tagName VARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE ProductTagAssignment (
    productTagAssignmentId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    tagId INT NOT NULL,
    FOREIGN KEY (productId) REFERENCES Product(productId),
    FOREIGN KEY (tagId) REFERENCES ProductTag(tagId)
);
CREATE TABLE ShippingMethod (
    shippingMethodId INT AUTO_INCREMENT PRIMARY KEY,
    methodName VARCHAR(100) NOT NULL,
    cost DECIMAL(10, 2),
    estimatedDeliveryTime VARCHAR(100)
);
CREATE TABLE ShipmentTracking (
    trackingId INT AUTO_INCREMENT PRIMARY KEY,
    shipmentId INT NOT NULL,
    updateDate DATE NOT NULL,
    status VARCHAR(50) NOT NULL,
    location VARCHAR(255),
    FOREIGN KEY (shipmentId) REFERENCES Shipment(shipmentId)
);
CREATE TABLE ReturnRequest (
    returnRequestId INT AUTO_INCREMENT PRIMARY KEY,
    orderId INT NOT NULL,
    productId INT NOT NULL,
    returnDate DATE NOT NULL,
    returnReason TEXT,
    status VARCHAR(50) NOT NULL,  -- e.g., 'Pending', 'Approved', 'Rejected'
    FOREIGN KEY (orderId) REFERENCES `Order`(orderId),
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE LoyaltyProgram (
    loyaltyProgramId INT AUTO_INCREMENT PRIMARY KEY,
    programName VARCHAR(100) NOT NULL,
    description TEXT,
    pointsRequired INT NOT NULL,
    reward VARCHAR(100) NOT NULL
);
CREATE TABLE LoyaltyPoints (
    loyaltyPointsId INT AUTO_INCREMENT PRIMARY KEY,
    userId INT NOT NULL,
    points INT NOT NULL,
    dateUpdated DATE NOT NULL,
    FOREIGN KEY (userId) REFERENCES User(userId)
);
CREATE TABLE CustomProductRequest (
    requestId INT AUTO_INCREMENT PRIMARY KEY,
    userId INT NOT NULL,
    productName VARCHAR(100) NOT NULL,
    description TEXT,
    requestedDate DATE NOT NULL,
    status VARCHAR(50) NOT NULL,  -- e.g., 'Pending', 'In Progress', 'Completed'
    FOREIGN KEY (userId) REFERENCES User(userId)
);
CREATE TABLE SupplierContactLog (
    contactLogId INT AUTO_INCREMENT PRIMARY KEY,
    supplierId INT NOT NULL,
    contactDate DATE NOT NULL,
    contactMethod VARCHAR(50) NOT NULL,  -- e.g., 'Email', 'Phone'
    notes TEXT,
    FOREIGN KEY (supplierId) REFERENCES Supplier(supplierId)
);
CREATE TABLE ProductSpecification (
    specificationId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    specName VARCHAR(100) NOT NULL,
    specValue VARCHAR(255) NOT NULL,
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE FAQ (
    faqId INT AUTO_INCREMENT PRIMARY KEY,
    question TEXT NOT NULL,
    answer TEXT NOT NULL,
    productId INT,
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE ProductAlert (
    alertId INT AUTO_INCREMENT PRIMARY KEY,
    userId INT NOT NULL,
    productId INT NOT NULL,
    alertType VARCHAR(50) NOT NULL,  -- e.g., 'Restock', 'Price Drop'
    alertDate DATE NOT NULL,
    FOREIGN KEY (userId) REFERENCES User(userId),
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE ProductComparison (
    comparisonId INT AUTO_INCREMENT PRIMARY KEY,
    userId INT NOT NULL,
    comparisonDate DATE NOT NULL,
    FOREIGN KEY (userId) REFERENCES User(userId)
);
CREATE TABLE ComparisonItem (
    comparisonItemId INT AUTO_INCREMENT PRIMARY KEY,
    comparisonId INT NOT NULL,
    productId INT NOT NULL,
    FOREIGN KEY (comparisonId) REFERENCES ProductComparison(comparisonId),
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE StorePromotion (
    promotionId INT AUTO_INCREMENT PRIMARY KEY,
    storeId INT NOT NULL,
    promotionName VARCHAR(100) NOT NULL,
    promotionDescription TEXT,
    startDate DATE NOT NULL,
    endDate DATE NOT NULL,
    discount DECIMAL(5, 2),
    FOREIGN KEY (storeId) REFERENCES StoreLocator(storeId)
);
CREATE TABLE AffiliatePartner (
    affiliateId INT AUTO_INCREMENT PRIMARY KEY,
    partnerName VARCHAR(100) NOT NULL,
    contactEmail VARCHAR(100),
    contactPhone VARCHAR(50),
    commissionRate DECIMAL(5, 2),
    FOREIGN KEY (affiliateId) REFERENCES User(userId)  -- assuming user is also an affiliate
);
CREATE TABLE AffiliateSale (
    saleId INT AUTO_INCREMENT PRIMARY KEY,
    affiliateId INT NOT NULL,
    orderId INT NOT NULL,
    commission DECIMAL(10, 2) NOT NULL,
    saleDate DATE NOT NULL,
    FOREIGN KEY (affiliateId) REFERENCES AffiliatePartner(affiliateId),
    FOREIGN KEY (orderId) REFERENCES `Order`(orderId)
);
CREATE TABLE Event (
    eventId INT AUTO_INCREMENT PRIMARY KEY,
    eventName VARCHAR(100) NOT NULL,
    eventDate DATE NOT NULL,
    eventLocation VARCHAR(255),
    eventDescription TEXT
);
CREATE TABLE EventRegistration (
    registrationId INT AUTO_INCREMENT PRIMARY KEY,
    eventId INT NOT NULL,
    userId INT NOT NULL,
    registrationDate DATE NOT NULL,
    FOREIGN KEY (eventId) REFERENCES Event(eventId),
    FOREIGN KEY (userId) REFERENCES User(userId)
);
CREATE TABLE ProductWarranty (
    warrantyId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    warrantyPeriod INT NOT NULL,  -- in months
    warrantyDescription TEXT,
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE WarrantyClaim (
    claimId INT AUTO_INCREMENT PRIMARY KEY,
    warrantyId INT NOT NULL,
    userId INT NOT NULL,
    claimDate DATE NOT NULL,
    claimDescription TEXT,
    status VARCHAR(50) NOT NULL,  -- e.g., 'Pending', 'Approved', 'Rejected'
    FOREIGN KEY (warrantyId) REFERENCES ProductWarranty(warrantyId),
    FOREIGN KEY (userId) REFERENCES User(userId)
);
CREATE TABLE ProductMaintenance (
    maintenanceId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    maintenanceDate DATE NOT NULL,
    maintenanceDetails TEXT,
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE UserPreference (
    preferenceId INT AUTO_INCREMENT PRIMARY KEY,
    userId INT NOT NULL,
    preferenceKey VARCHAR(100) NOT NULL,
    preferenceValue VARCHAR(255),
    FOREIGN KEY (userId) REFERENCES User(userId)
);
CREATE TABLE ProductInstallation (
    installationId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    installationDate DATE NOT NULL,
    installerName VARCHAR(100),
    installationDetails TEXT,
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE ProductCustomization (
    customizationId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    customizationType VARCHAR(100) NOT NULL,  -- e.g., 'Color', 'Size'
    customizationOptions TEXT NOT NULL,
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE ServiceTicket (
    ticketId INT AUTO_INCREMENT PRIMARY KEY,
    userId INT NOT NULL,
    issueDate DATE NOT NULL,
    issueDescription TEXT NOT NULL,
    status VARCHAR(50) NOT NULL,  -- e.g., 'Open', 'In Progress', 'Resolved'
    resolution TEXT,
    FOREIGN KEY (userId) REFERENCES User(userId)
);
CREATE TABLE ProductAffiliation (
    affiliationId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    brandName VARCHAR(100) NOT NULL,
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE SupplierRating (
    ratingId INT AUTO_INCREMENT PRIMARY KEY,
    supplierId INT NOT NULL,
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    review TEXT,
    ratingDate DATE NOT NULL,
    FOREIGN KEY (supplierId) REFERENCES Supplier(supplierId)
);
CREATE TABLE PriceHistory (
    priceHistoryId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    changeDate DATE NOT NULL,
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE ProductMaterial (
    materialId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    materialName VARCHAR(100) NOT NULL,
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE UserRole (
    roleId INT AUTO_INCREMENT PRIMARY KEY,
    roleName VARCHAR(100) NOT NULL,
    permissions TEXT NOT NULL  -- e.g., 'read,write,delete'
);
CREATE TABLE UserRoleAssignment (
    userRoleId INT AUTO_INCREMENT PRIMARY KEY,
    userId INT NOT NULL,
    roleId INT NOT NULL,
    assignmentDate DATE NOT NULL,
    FOREIGN KEY (userId) REFERENCES User(userId),
    FOREIGN KEY (roleId) REFERENCES UserRole(roleId)
);
CREATE TABLE ProductUsage (
    usageId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    usageDate DATE NOT NULL,
    quantityUsed INT NOT NULL,
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE ReturnReason (
    reasonId INT AUTO_INCREMENT PRIMARY KEY,
    reasonDescription TEXT NOT NULL
);
CREATE TABLE ReturnRequestReason (
    returnRequestReasonId INT AUTO_INCREMENT PRIMARY KEY,
    returnRequestId INT NOT NULL,
    reasonId INT NOT NULL,
    FOREIGN KEY (returnRequestId) REFERENCES ReturnRequest(returnRequestId),
    FOREIGN KEY (reasonId) REFERENCES ReturnReason(reasonId)
);
CREATE TABLE WarrantyExtension (
    extensionId INT AUTO_INCREMENT PRIMARY KEY,
    warrantyId INT NOT NULL,
    extensionPeriod INT NOT NULL,  -- in months
    cost DECIMAL(10, 2),
    FOREIGN KEY (warrantyId) REFERENCES ProductWarranty(warrantyId)
);
CREATE TABLE LoyaltyProgramLevel (
    levelId INT AUTO_INCREMENT PRIMARY KEY,
    levelName VARCHAR(100) NOT NULL,
    minPointsRequired INT NOT NULL,
    benefits TEXT
);
CREATE TABLE UserLoyaltyLevel (
    userLoyaltyLevelId INT AUTO_INCREMENT PRIMARY KEY,
    userId INT NOT NULL,
    levelId INT NOT NULL,
    effectiveDate DATE NOT NULL,
    FOREIGN KEY (userId) REFERENCES User(userId),
    FOREIGN KEY (levelId) REFERENCES LoyaltyProgramLevel(levelId)
);
CREATE TABLE SupplierContract (
    contractId INT AUTO_INCREMENT PRIMARY KEY,
    supplierId INT NOT NULL,
    contractDate DATE NOT NULL,
    expirationDate DATE,
    contractDetails TEXT,
    FOREIGN KEY (supplierId) REFERENCES Supplier(supplierId)
);
CREATE TABLE ProductCategory (
    categoryId INT AUTO_INCREMENT PRIMARY KEY,
    categoryName VARCHAR(100) NOT NULL,
    parentCategoryId INT,
    FOREIGN KEY (parentCategoryId) REFERENCES ProductCategory(categoryId)
);
CREATE TABLE ProductVariant (
    variantId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    variantName VARCHAR(100) NOT NULL,
    variantValue VARCHAR(100) NOT NULL,
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE LoyaltyReward (
    rewardId INT AUTO_INCREMENT PRIMARY KEY,
    rewardName VARCHAR(100) NOT NULL,
    rewardDescription TEXT,
    pointsRequired INT NOT NULL
);
CREATE TABLE RewardRedemption (
    redemptionId INT AUTO_INCREMENT PRIMARY KEY,
    userId INT NOT NULL,
    rewardId INT NOT NULL,
    redemptionDate DATE NOT NULL,
    FOREIGN KEY (userId) REFERENCES User(userId),
    FOREIGN KEY (rewardId) REFERENCES LoyaltyReward(rewardId)
);
CREATE TABLE SupplierPerformance (
    performanceId INT AUTO_INCREMENT PRIMARY KEY,
    supplierId INT NOT NULL,
    metricName VARCHAR(100) NOT NULL,
    metricValue DECIMAL(10, 2),
    recordDate DATE NOT NULL,
    FOREIGN KEY (supplierId) REFERENCES Supplier(supplierId)
);
CREATE TABLE InventoryLocation (
    locationId INT AUTO_INCREMENT PRIMARY KEY,
    locationName VARCHAR(100) NOT NULL,
    locationAddress TEXT NOT NULL
);
CREATE TABLE StockAtLocation (
    stockLocationId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    locationId INT NOT NULL,
    stockQuantity INT NOT NULL,
    FOREIGN KEY (productId) REFERENCES Product(productId),
    FOREIGN KEY (locationId) REFERENCES InventoryLocation(locationId)
);
CREATE TABLE ProductCampaign (
    campaignId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    campaignName VARCHAR(100) NOT NULL,
    startDate DATE NOT NULL,
    endDate DATE NOT NULL,
    discount DECIMAL(5, 2),
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE CustomerSegment (
    segmentId INT AUTO_INCREMENT PRIMARY KEY,
    segmentName VARCHAR(100) NOT NULL,
    segmentCriteria TEXT
);
CREATE TABLE CustomerSegmentAssignment (
    segmentAssignmentId INT AUTO_INCREMENT PRIMARY KEY,
    userId INT NOT NULL,
    segmentId INT NOT NULL,
    assignmentDate DATE NOT NULL,
    FOREIGN KEY (userId) REFERENCES User(userId),
    FOREIGN KEY (segmentId) REFERENCES CustomerSegment(segmentId)
);
CREATE TABLE ProductKit (
    kitId INT AUTO_INCREMENT PRIMARY KEY,
    kitName VARCHAR(100) NOT NULL,
    kitDescription TEXT,
    kitPrice DECIMAL(10, 2) NOT NULL
);
CREATE TABLE KitComponent (
    kitComponentId INT AUTO_INCREMENT PRIMARY KEY,
    kitId INT NOT NULL,
    productId INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (kitId) REFERENCES ProductKit(kitId),
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE PurchaseOrder (
    purchaseOrderId INT AUTO_INCREMENT PRIMARY KEY,
    supplierId INT NOT NULL,
    orderDate DATE NOT NULL,
    status VARCHAR(50) NOT NULL,  -- e.g., 'Pending', 'Completed', 'Cancelled'
    totalAmount DECIMAL(10, 2),
    FOREIGN KEY (supplierId) REFERENCES Supplier(supplierId)
);
CREATE TABLE PurchaseOrderItem (
    purchaseOrderItemId INT AUTO_INCREMENT PRIMARY KEY,
    purchaseOrderId INT NOT NULL,
    productId INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2),
    FOREIGN KEY (purchaseOrderId) REFERENCES PurchaseOrder(purchaseOrderId),
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE CustomerPurchaseHistory (
    historyId INT AUTO_INCREMENT PRIMARY KEY,
    userId INT NOT NULL,
    orderId INT NOT NULL,
    purchaseDate DATE NOT NULL,
    totalAmount DECIMAL(10, 2),
    FOREIGN KEY (userId) REFERENCES User(userId),
    FOREIGN KEY (orderId) REFERENCES `Order`(orderId)
);

CREATE TABLE ProductExpiry (
    expiryId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    expiryDate DATE NOT NULL,
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE ProductAssembly (
    assemblyId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    assemblyInstructions TEXT NOT NULL,
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE ProductCertification (
    certificationId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    certificationName VARCHAR(100) NOT NULL,
    certificationDate DATE NOT NULL,
    certificationDetails TEXT,
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE WarrantyClaimsHistory (
    claimsHistoryId INT AUTO_INCREMENT PRIMARY KEY,
    warrantyId INT NOT NULL,
    claimDate DATE NOT NULL,
    claimStatus VARCHAR(50) NOT NULL,  -- e.g., 'Pending', 'Approved', 'Rejected'
    resolutionDetails TEXT,
    FOREIGN KEY (warrantyId) REFERENCES ProductWarranty(warrantyId)
);
CREATE TABLE CustomerPurchasePreference (
    preferenceId INT AUTO_INCREMENT PRIMARY KEY,
    userId INT NOT NULL,
    preferenceType VARCHAR(100) NOT NULL,  -- e.g., 'Brand', 'Style'
    preferenceValue VARCHAR(100) NOT NULL,
    FOREIGN KEY (userId) REFERENCES User(userId)
);
CREATE TABLE CustomerInteractionLog (
    interactionId INT AUTO_INCREMENT PRIMARY KEY,
    userId INT NOT NULL,
    interactionDate DATE NOT NULL,
    interactionType VARCHAR(50) NOT NULL,  -- e.g., 'Chat', 'Call'
    interactionDetails TEXT,
    FOREIGN KEY (userId) REFERENCES User(userId)
);
CREATE TABLE ProductAvailability (
    availabilityId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    storeId INT,
    onlineAvailability BOOLEAN NOT NULL,
    inStoreAvailability BOOLEAN NOT NULL,
    FOREIGN KEY (productId) REFERENCES Product(productId),
    FOREIGN KEY (storeId) REFERENCES StoreLocator(storeId)
);
CREATE TABLE InstallationService (
    serviceId INT AUTO_INCREMENT PRIMARY KEY,
    serviceName VARCHAR(100) NOT NULL,
    serviceDescription TEXT,
    serviceCost DECIMAL(10, 2)
);
CREATE TABLE InstallationServiceRequest (
    requestId INT AUTO_INCREMENT PRIMARY KEY,
    userId INT NOT NULL,
    productId INT NOT NULL,
    serviceId INT NOT NULL,
    requestDate DATE NOT NULL,
    requestStatus VARCHAR(50) NOT NULL,  -- e.g., 'Requested', 'In Progress', 'Completed'
    FOREIGN KEY (userId) REFERENCES User(userId),
    FOREIGN KEY (productId) REFERENCES Product(productId),
    FOREIGN KEY (serviceId) REFERENCES InstallationService(serviceId)
);
CREATE TABLE SupplierProductAssociation (
    associationId INT AUTO_INCREMENT PRIMARY KEY,
    supplierId INT NOT NULL,
    productId INT NOT NULL,
    associationDate DATE NOT NULL,
    FOREIGN KEY (supplierId) REFERENCES Supplier(supplierId),
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE ProductReturn (
    returnId INT AUTO_INCREMENT PRIMARY KEY,
    orderId INT NOT NULL,
    productId INT NOT NULL,
    returnDate DATE NOT NULL,
    returnReason TEXT,
    returnStatus VARCHAR(50) NOT NULL,  -- e.g., 'Requested', 'Approved', 'Rejected'
    FOREIGN KEY (orderId) REFERENCES `Order`(orderId),
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE ServiceFeedback (
    feedbackId INT AUTO_INCREMENT PRIMARY KEY,
    userId INT NOT NULL,
    serviceId INT NOT NULL,
    feedbackDate DATE NOT NULL,
    feedbackText TEXT,
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    FOREIGN KEY (userId) REFERENCES User(userId),
    FOREIGN KEY (serviceId) REFERENCES InstallationService(serviceId)
);
CREATE TABLE MarketingCampaignType (
    campaignTypeId INT AUTO_INCREMENT PRIMARY KEY,
    typeName VARCHAR(100) NOT NULL,
    typeDescription TEXT
);
CREATE TABLE MarketingCampaignDetail (
    campaignDetailId INT AUTO_INCREMENT PRIMARY KEY,
    campaignId INT NOT NULL,
    campaignTypeId INT NOT NULL,
    startDate DATE NOT NULL,
    endDate DATE NOT NULL,
    budget DECIMAL(10, 2),
    FOREIGN KEY (campaignId) REFERENCES ProductCampaign(campaignId),
    FOREIGN KEY (campaignTypeId) REFERENCES MarketingCampaignType(campaignTypeId)
);
CREATE TABLE ProductRecall (
    recallId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    recallDate DATE NOT NULL,
    recallReason TEXT NOT NULL,
    recallInstructions TEXT,
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE ProductMaintenance (
    maintenanceId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    maintenanceDate DATE NOT NULL,
    maintenanceType VARCHAR(100) NOT NULL,  -- e.g., 'Cleaning', 'Repair'
    maintenanceDetails TEXT,
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE CustomerSubscription (
    subscriptionId INT AUTO_INCREMENT PRIMARY KEY,
    userId INT NOT NULL,
    planName VARCHAR(100) NOT NULL,
    planDescription TEXT,
    startDate DATE NOT NULL,
    endDate DATE,
    subscriptionStatus VARCHAR(50) NOT NULL,  -- e.g., 'Active', 'Expired', 'Cancelled'
    FOREIGN KEY (userId) REFERENCES User(userId)
);
CREATE TABLE SubscriptionPlanBenefit (
    benefitId INT AUTO_INCREMENT PRIMARY KEY,
    subscriptionId INT NOT NULL,
    benefitDescription TEXT NOT NULL,
    FOREIGN KEY (subscriptionId) REFERENCES CustomerSubscription(subscriptionId)
);
CREATE TABLE CustomerPurchasePreference (
    preferenceId INT AUTO_INCREMENT PRIMARY KEY,
    userId INT NOT NULL,
    preferenceCategory VARCHAR(100) NOT NULL,  -- e.g., 'Color', 'Material'
    preferenceValue VARCHAR(100) NOT NULL,
    FOREIGN KEY (userId) REFERENCES User(userId)
);
CREATE TABLE QualityAssurance (
    qaId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    qaDate DATE NOT NULL,
    qaResult VARCHAR(50) NOT NULL,  -- e.g., 'Passed', 'Failed'
    qaComments TEXT,
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE SupportTicket (
    ticketId INT AUTO_INCREMENT PRIMARY KEY,
    userId INT NOT NULL,
    ticketDate DATE NOT NULL,
    ticketStatus VARCHAR(50) NOT NULL,  -- e.g., 'Open', 'In Progress', 'Closed'
    ticketSubject VARCHAR(255) NOT NULL,
    ticketDescription TEXT,
    FOREIGN KEY (userId) REFERENCES User(userId)
);
CREATE TABLE TicketResponse (
    responseId INT AUTO_INCREMENT PRIMARY KEY,
    ticketId INT NOT NULL,
    responseDate DATE NOT NULL,
    responseText TEXT NOT NULL,
    FOREIGN KEY (ticketId) REFERENCES SupportTicket(ticketId)
);
CREATE TABLE ProductPromotion (
    promotionId INT AUTO_INCREMENT PRIMARY KEY,
    promotionName VARCHAR(100) NOT NULL,
    promotionDescription TEXT,
    startDate DATE NOT NULL,
    endDate DATE NOT NULL,
    discount DECIMAL(5, 2) NOT NULL
);
CREATE TABLE PromotionProduct (
    promotionProductId INT AUTO_INCREMENT PRIMARY KEY,
    promotionId INT NOT NULL,
    productId INT NOT NULL,
    FOREIGN KEY (promotionId) REFERENCES ProductPromotion(promotionId),
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE ManufacturingBatch (
    batchId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    batchNumber VARCHAR(100) NOT NULL,
    productionDate DATE NOT NULL,
    expiryDate DATE,
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE ProductRepair (
    repairId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    repairDate DATE NOT NULL,
    repairDetails TEXT NOT NULL,
    repairCost DECIMAL(10, 2),
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE SupplierContact (
    contactId INT AUTO_INCREMENT PRIMARY KEY,
    supplierId INT NOT NULL,
    contactName VARCHAR(100) NOT NULL,
    contactPhone VARCHAR(50),
    contactEmail VARCHAR(100),
    contactRole VARCHAR(50),
    FOREIGN KEY (supplierId) REFERENCES Supplier(supplierId)
);
CREATE TABLE InventoryReplenishmentRequest (
    requestId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    requestedQuantity INT NOT NULL,
    requestDate DATE NOT NULL,
    requestStatus VARCHAR(50) NOT NULL,  -- e.g., 'Pending', 'Approved', 'Rejected'
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE StoreProductAvailability (
    availabilityId INT AUTO_INCREMENT PRIMARY KEY,
    storeId INT NOT NULL,
    productId INT NOT NULL,
    availableQuantity INT NOT NULL,
    FOREIGN KEY (storeId) REFERENCES StoreLocator(storeId),
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE InstallationGuide (
    guideId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    guideTitle VARCHAR(100) NOT NULL,
    guideContent TEXT NOT NULL,
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE ProductSafetyWarning (
    warningId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    warningMessage TEXT NOT NULL,
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE ProductUsageInstruction (
    instructionId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    instructionText TEXT NOT NULL,
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE ProductSpecification (
    specificationId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    specificationName VARCHAR(100) NOT NULL,
    specificationValue VARCHAR(255) NOT NULL,
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE ProductAccessory (
    accessoryId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    accessoryName VARCHAR(100) NOT NULL,
    accessoryDescription TEXT,
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE ProductDesignVariant (
    variantId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    designVariant VARCHAR(100) NOT NULL,  -- e.g., 'Matte Finish', 'Glossy Finish'
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE CustomerOrderHistory (
    historyId INT AUTO_INCREMENT PRIMARY KEY,
    userId INT NOT NULL,
    orderId INT NOT NULL,
    orderDate DATE NOT NULL,
    orderAmount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (userId) REFERENCES User(userId),
    FOREIGN KEY (orderId) REFERENCES `Order`(orderId)
);
CREATE TABLE ProductAvailabilityAlert (
    alertId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    userId INT NOT NULL,
    alertDate DATE NOT NULL,
    FOREIGN KEY (productId) REFERENCES Product(productId),
    FOREIGN KEY (userId) REFERENCES User(userId)
);
CREATE TABLE UserPreference (
    preferenceId INT AUTO_INCREMENT PRIMARY KEY,
    userId INT NOT NULL,
    preferenceType VARCHAR(100) NOT NULL,  -- e.g., 'Notification', 'Display Setting'
    preferenceValue VARCHAR(100) NOT NULL,
    FOREIGN KEY (userId) REFERENCES User(userId)
);
CREATE TABLE InventoryAuditLog (
    auditLogId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    changeDate DATE NOT NULL,
    changeType VARCHAR(50) NOT NULL,  -- e.g., 'Addition', 'Reduction'
    changeQuantity INT NOT NULL,
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE SupplierPerformance (
    performanceId INT AUTO_INCREMENT PRIMARY KEY,
    supplierId INT NOT NULL,
    metricName VARCHAR(100) NOT NULL,
    metricValue DECIMAL(10, 2) NOT NULL,
    evaluationDate DATE NOT NULL,
    FOREIGN KEY (supplierId) REFERENCES Supplier(supplierId)
);
CREATE TABLE ProductSalesReport (
    reportId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    reportDate DATE NOT NULL,
    totalSales DECIMAL(10, 2) NOT NULL,
    totalQuantitySold INT NOT NULL,
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE UserShoppingPreference (
    preferenceId INT AUTO_INCREMENT PRIMARY KEY,
    userId INT NOT NULL,
    preferenceType VARCHAR(100) NOT NULL,  -- e.g., 'Category', 'Brand'
    preferenceValue VARCHAR(100) NOT NULL,
    FOREIGN KEY (userId) REFERENCES User(userId)
);
CREATE TABLE MarketingCampaignFeedback (
    feedbackId INT AUTO_INCREMENT PRIMARY KEY,
    campaignId INT NOT NULL,
    feedbackDate DATE NOT NULL,
    feedbackText TEXT,
    FOREIGN KEY (campaignId) REFERENCES ProductCampaign(campaignId)
);
CREATE TABLE CustomerLoyaltyPoints (
    pointsId INT AUTO_INCREMENT PRIMARY KEY,
    userId INT NOT NULL,
    pointsEarned INT NOT NULL,
    pointsRedeemed INT NOT NULL,
    balancePoints INT AS (pointsEarned - pointsRedeemed) STORED,
    lastUpdated DATE NOT NULL,
    FOREIGN KEY (userId) REFERENCES User(userId)
);
CREATE TABLE ProductWarranty (
    warrantyId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    warrantyPeriod INT NOT NULL,  -- Warranty period in months
    warrantyTerms TEXT,
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE ReturnRequest (
    returnId INT AUTO_INCREMENT PRIMARY KEY,
    orderId INT NOT NULL,
    productId INT NOT NULL,
    requestDate DATE NOT NULL,
    returnReason TEXT NOT NULL,
    returnStatus VARCHAR(50) NOT NULL,  -- e.g., 'Pending', 'Approved', 'Rejected'
    FOREIGN KEY (orderId) REFERENCES `Order`(orderId),
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE ServiceAgent (
    agentId INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(50),
    department VARCHAR(100),
    hireDate DATE NOT NULL
);
CREATE TABLE AgentInteractionLog (
    interactionId INT AUTO_INCREMENT PRIMARY KEY,
    agentId INT NOT NULL,
    userId INT NOT NULL,
    interactionDate DATE NOT NULL,
    interactionType VARCHAR(100) NOT NULL,  -- e.g., 'Call', 'Email'
    interactionDetails TEXT,
    FOREIGN KEY (agentId) REFERENCES ServiceAgent(agentId),
    FOREIGN KEY (userId) REFERENCES User(userId)
);
CREATE TABLE StoreInventory (
    storeInventoryId INT AUTO_INCREMENT PRIMARY KEY,
    storeId INT NOT NULL,
    productId INT NOT NULL,
    quantityInStock INT NOT NULL,
    lastUpdated DATE NOT NULL,
    FOREIGN KEY (storeId) REFERENCES StoreLocator(storeId),
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE CustomerPurchaseHistory (
    purchaseId INT AUTO_INCREMENT PRIMARY KEY,
    userId INT NOT NULL,
    productId INT NOT NULL,
    purchaseDate DATE NOT NULL,
    quantity INT NOT NULL,
    totalAmount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (userId) REFERENCES User(userId),
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE ProductCustomization (
    customizationId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    customizationType VARCHAR(100) NOT NULL,  -- e.g., 'Color', 'Size'
    customizationValue VARCHAR(100) NOT NULL,
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE AssemblyInstruction (
    instructionId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    instructionTitle VARCHAR(100) NOT NULL,
    instructionContent TEXT NOT NULL,
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE ReferralProgram (
    referralId INT AUTO_INCREMENT PRIMARY KEY,
    referrerUserId INT NOT NULL,
    refereeUserId INT,
    referralDate DATE NOT NULL,
    referralStatus VARCHAR(50) NOT NULL,  -- e.g., 'Pending', 'Confirmed'
    rewardEarned DECIMAL(10, 2),
    FOREIGN KEY (referrerUserId) REFERENCES User(userId),
    FOREIGN KEY (refereeUserId) REFERENCES User(userId)
);
CREATE TABLE QualityReport (
    reportId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    reportDate DATE NOT NULL,
    reportDetails TEXT NOT NULL,
    reportStatus VARCHAR(50) NOT NULL,  -- e.g., 'Open', 'Resolved'
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE CustomerDemographics (
    demographicId INT AUTO_INCREMENT PRIMARY KEY,
    userId INT NOT NULL,
    ageGroup VARCHAR(50),
    gender VARCHAR(10),
    location VARCHAR(100),
    FOREIGN KEY (userId) REFERENCES User(userId)
);
CREATE TABLE ProductCertification (
    certificationId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    certificationName VARCHAR(100) NOT NULL,
    certificationBody VARCHAR(100) NOT NULL,
    certificationDate DATE NOT NULL,
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE CustomerSurveyResponse (
    responseId INT AUTO_INCREMENT PRIMARY KEY,
    userId INT NOT NULL,
    surveyDate DATE NOT NULL,
    surveyQuestion VARCHAR(255) NOT NULL,
    surveyResponse TEXT NOT NULL,
    FOREIGN KEY (userId) REFERENCES User(userId)
);
CREATE TABLE MarketingCampaignBudget (
    budgetId INT AUTO_INCREMENT PRIMARY KEY,
    campaignId INT NOT NULL,
    allocatedBudget DECIMAL(10, 2) NOT NULL,
    spentAmount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (campaignId) REFERENCES ProductCampaign(campaignId)
);
CREATE TABLE RecallNotification (
    notificationId INT AUTO_INCREMENT PRIMARY KEY,
    recallId INT NOT NULL,
    userId INT NOT NULL,
    notificationDate DATE NOT NULL,
    notificationStatus VARCHAR(50) NOT NULL,  -- e.g., 'Sent', 'Acknowledged'
    FOREIGN KEY (recallId) REFERENCES ProductRecall(recallId),
    FOREIGN KEY (userId) REFERENCES User(userId)
);
CREATE TABLE InstallationService (
    serviceId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    serviceDescription TEXT,
    serviceCost DECIMAL(10, 2),
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE MaintenanceService (
    maintenanceId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    serviceDescription TEXT,
    serviceCost DECIMAL(10, 2),
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE ServiceTicket (
    ticketId INT AUTO_INCREMENT PRIMARY KEY,
    userId INT NOT NULL,
    ticketDate DATE NOT NULL,
    issueDescription TEXT NOT NULL,
    ticketStatus VARCHAR(50) NOT NULL,  -- e.g., 'Open', 'In Progress', 'Resolved'
    FOREIGN KEY (userId) REFERENCES User(userId)
);
CREATE TABLE ProductAvailability (
    availabilityId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    storeId INT NOT NULL,
    stockQuantity INT NOT NULL,
    FOREIGN KEY (productId) REFERENCES Product(productId),
    FOREIGN KEY (storeId) REFERENCES StoreLocator(storeId)
);
CREATE TABLE SeasonalPromotion (
    promotionId INT AUTO_INCREMENT PRIMARY KEY,
    promotionName VARCHAR(100) NOT NULL,
    startDate DATE NOT NULL,
    endDate DATE NOT NULL,
    discountPercentage DECIMAL(5, 2),
    promotionDetails TEXT
);
CREATE TABLE ReturnManagement (
    managementId INT AUTO_INCREMENT PRIMARY KEY,
    returnId INT NOT NULL,
    actionTaken VARCHAR(100) NOT NULL,  -- e.g., 'Refund Issued', 'Replacement Sent'
    actionDate DATE NOT NULL,
    FOREIGN KEY (returnId) REFERENCES ReturnRequest(returnId)
);
CREATE TABLE FeedbackAnalysis (
    analysisId INT AUTO_INCREMENT PRIMARY KEY,
    feedbackId INT NOT NULL,
    analysisDate DATE NOT NULL,
    analysisSummary TEXT NOT NULL,
    sentimentScore DECIMAL(5, 2),  -- e.g., -1 to 1
    FOREIGN KEY (feedbackId) REFERENCES CustomerFeedback(feedbackId)
);
CREATE TABLE SupplierContract (
    contractId INT AUTO_INCREMENT PRIMARY KEY,
    supplierId INT NOT NULL,
    contractStartDate DATE NOT NULL,
    contractEndDate DATE NOT NULL,
    contractTerms TEXT,
    FOREIGN KEY (supplierId) REFERENCES Supplier(supplierId)
);
CREATE TABLE ProductRandD (
    rdId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    projectName VARCHAR(100) NOT NULL,
    projectDetails TEXT,
    projectStartDate DATE NOT NULL,
    projectEndDate DATE,
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE ProductExpiration (
    expirationId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    expirationDate DATE NOT NULL,
    isExpired BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE ProductBatch (
    batchId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    batchNumber VARCHAR(100) NOT NULL,
    productionDate DATE NOT NULL,
    expirationDate DATE,
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE WarrantyClaim (
    claimId INT AUTO_INCREMENT PRIMARY KEY,
    warrantyId INT NOT NULL,
    userId INT NOT NULL,
    claimDate DATE NOT NULL,
    claimStatus VARCHAR(50) NOT NULL,  -- e.g., 'Pending', 'Approved', 'Rejected'
    claimDetails TEXT,
    FOREIGN KEY (warrantyId) REFERENCES ProductWarranty(warrantyId),
    FOREIGN KEY (userId) REFERENCES User(userId)
);
CREATE TABLE AccessoryInventory (
    inventoryId INT AUTO_INCREMENT PRIMARY KEY,
    accessoryId INT NOT NULL,
    stockQuantity INT NOT NULL,
    lastUpdated DATE NOT NULL,
    FOREIGN KEY (accessoryId) REFERENCES ProductAccessory(accessoryId)
);
CREATE TABLE UserPurchasePreference (
    preferenceId INT AUTO_INCREMENT PRIMARY KEY,
    userId INT NOT NULL,
    preferenceType VARCHAR(100) NOT NULL,  -- e.g., 'Preferred Brand', 'Favorite Product'
    preferenceValue VARCHAR(100) NOT NULL,
    FOREIGN KEY (userId) REFERENCES User(userId)
);
CREATE TABLE MarketingMaterial (
    materialId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    materialType VARCHAR(100) NOT NULL,  -- e.g., 'Brochure', 'Flyer'
    materialContent TEXT,
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE TradeInProgram (
    tradeInId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    tradeInValue DECIMAL(10, 2) NOT NULL,
    tradeInCondition VARCHAR(100),
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE SubscriptionService (
    subscriptionId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    subscriptionType VARCHAR(100) NOT NULL,  -- e.g., 'Monthly', 'Yearly'
    subscriptionCost DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE ServiceFeedback (
    feedbackId INT AUTO_INCREMENT PRIMARY KEY,
    serviceTicketId INT NOT NULL,
    feedbackDate DATE NOT NULL,
    feedbackRating INT NOT NULL,  -- e.g., 1 to 5
    feedbackComments TEXT,
    FOREIGN KEY (serviceTicketId) REFERENCES ServiceTicket(ticketId)
);
CREATE TABLE ProductSustainability (
    sustainabilityId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    sustainabilityRating INT,  -- e.g., 1 to 5
    sustainabilityCertifications TEXT,
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE CustomizationRequest (
    requestId INT AUTO_INCREMENT PRIMARY KEY,
    userId INT NOT NULL,
    productId INT NOT NULL,
    requestDate DATE NOT NULL,
    customizationDetails TEXT NOT NULL,
    requestStatus VARCHAR(50) NOT NULL,  -- e.g., 'Pending', 'In Progress', 'Completed'
    FOREIGN KEY (userId) REFERENCES User(userId),
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE WarrantyExtension (
    extensionId INT AUTO_INCREMENT PRIMARY KEY,
    warrantyId INT NOT NULL,
    extensionPeriod INT NOT NULL,  -- Extension period in months
    extensionCost DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (warrantyId) REFERENCES ProductWarranty(warrantyId)
);
CREATE TABLE StoreStaff (
    staffId INT AUTO_INCREMENT PRIMARY KEY,
    storeId INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    position VARCHAR(100),
    phone VARCHAR(50),
    email VARCHAR(100),
    FOREIGN KEY (storeId) REFERENCES StoreLocator(storeId)
);
CREATE TABLE SeasonalInventoryAdjustment (
    adjustmentId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    storeId INT NOT NULL,
    adjustmentDate DATE NOT NULL,
    adjustmentQuantity INT NOT NULL,
    FOREIGN KEY (productId) REFERENCES Product(productId),
    FOREIGN KEY (storeId) REFERENCES StoreLocator(storeId)
);
CREATE TABLE PurchasePreference (
    preferenceId INT AUTO_INCREMENT PRIMARY KEY,
    userId INT NOT NULL,
    preferenceType VARCHAR(100) NOT NULL,  -- e.g., 'Preferred Material', 'Style Preference'
    preferenceValue VARCHAR(100) NOT NULL,
    FOREIGN KEY (userId) REFERENCES User(userId)
);
CREATE TABLE DesignRequest (
    requestId INT AUTO_INCREMENT PRIMARY KEY,
    userId INT NOT NULL,
    productId INT NOT NULL,
    requestDate DATE NOT NULL,
    designDetails TEXT NOT NULL,
    requestStatus VARCHAR(50) NOT NULL,  -- e.g., 'Pending', 'Approved', 'Rejected'
    FOREIGN KEY (userId) REFERENCES User(userId),
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE TestingReport (
    reportId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    testDate DATE NOT NULL,
    testResults TEXT NOT NULL,
    reportDetails TEXT,
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE ProductRecall (
    recallId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    recallDate DATE NOT NULL,
    recallReason TEXT NOT NULL,
    recallStatus VARCHAR(50) NOT NULL,  -- e.g., 'Notified', 'Resolved'
    FOREIGN KEY (productId) REFERENCES Product(productId)
);
CREATE TABLE AccountSettings (
    settingId INT AUTO_INCREMENT PRIMARY KEY,
    userId INT NOT NULL,
    settingKey VARCHAR(100) NOT NULL,
    settingValue VARCHAR(100),
    FOREIGN KEY (userId) REFERENCES User(userId)
);


INSERT INTO Address (addressId, street, city, state, zipCode) VALUES
(1, '123 Main St', 'Albuquerque', 'NM', '87101'),
(2, '456 Oak St', 'Santa Fe', 'NM', '87501'),
(3, '789 Pine St', 'Las Cruces', 'NM', '88001'),
(4, '101 Maple St', 'Roswell', 'NM', '88201'),
(5, '202 Elm St', 'Taos', 'NM', '87571'),
(6, '303 Cedar St', 'Farmington', 'NM', '87401'),
(7, '404 Birch St', 'Gallup', 'NM', '87301'),
(8, '505 Aspen St', 'Clovis', 'NM', '88101'),
(9, '606 Walnut St', 'Hobbs', 'NM', '88240'),
(10, '707 Spruce St', 'Carlsbad', 'NM', '88220');

INSERT INTO User (userId, name, email, password, role, addressId) VALUES
(1, 'Alice Smith', 'alice@example.com', 'password1', 'customer', 1),
(2, 'Bob Johnson', 'bob@example.com', 'password2', 'customer', 2),
(3, 'Carol Taylor', 'carol@example.com', 'password3', 'admin', 3),
(4, 'David Brown', 'david@example.com', 'password4', 'customer', 4),
(5, 'Eve Davis', 'eve@example.com', 'password5', 'seller', 5),
(6, 'Frank Miller', 'frank@example.com', 'password6', 'customer', 6),
(7, 'Grace Wilson', 'grace@example.com', 'password7', 'seller', 7),
(8, 'Henry Moore', 'henry@example.com', 'password8', 'admin', 8),
(9, 'Ivy Thomas', 'ivy@example.com', 'password9', 'customer', 9),
(10, 'Jack White', 'jack@example.com', 'password10', 'customer', 10);

INSERT INTO Category (categoryId, name, description) VALUES
(1, 'Electronics', 'Electronic gadgets and devices'),
(2, 'Books', 'Fiction and non-fiction books'),
(3, 'Clothing', 'Men\'s and Women\'s Clothing'),
(4, 'Home & Kitchen', 'Home appliances and kitchenware'),
(5, 'Sports', 'Sports equipment and accessories'),
(6, 'Toys', 'Children\'s toys and games'),
(7, 'Beauty', 'Beauty products and cosmetics'),
(8, 'Automotive', 'Car accessories and parts'),
(9, 'Garden', 'Gardening tools and supplies'),
(10, 'Health', 'Healthcare products and supplements');

INSERT INTO Product (productId, name, description, price, stock, categoryId) VALUES
(1, 'Smartphone', 'Latest model smartphone', 699.99, 50, 1),
(2, 'Laptop', 'High-performance laptop', 999.99, 30, 1),
(3, 'Mystery Novel', 'Thrilling mystery novel', 19.99, 100, 2),
(4, 'Jeans', 'Comfortable denim jeans', 49.99, 80, 3),
(5, 'Blender', 'High-speed blender', 89.99, 40, 4),
(6, 'Basketball', 'Official size basketball', 29.99, 60, 5),
(7, 'Doll', 'Cute and cuddly doll', 14.99, 100, 6),
(8, 'Lipstick', 'Long-lasting lipstick', 24.99, 70, 7),
(9, 'Car Charger', 'Fast car charger', 19.99, 50, 8),
(10, 'Garden Hose', 'Flexible garden hose', 29.99, 50, 9);

INSERT INTO `Order` (orderId, userId, orderDate, status, totalAmount) VALUES
(1, 1, '2024-08-01', 'Shipped', 719.98),
(2, 2, '2024-08-02', 'Delivered', 1049.98),
(3, 3, '2024-08-03', 'Cancelled', 19.99),
(4, 4, '2024-08-04', 'Pending', 99.98),
(5, 5, '2024-08-05', 'Processing', 89.99),
(6, 6, '2024-08-06', 'Delivered', 29.99),
(7, 7, '2024-08-07', 'Shipped', 14.99),
(8, 8, '2024-08-08', 'Delivered', 24.99),
(9, 9, '2024-08-09', 'Cancelled', 49.99),
(10, 10, '2024-08-10', 'Pending', 29.99);

INSERT INTO OrderItem (orderItemId, orderId, productId, quantity, price) VALUES
(1, 1, 1, 1, 699.99),
(2, 2, 2, 1, 999.99),
(3, 3, 3, 1, 19.99),
(4, 4, 4, 2, 49.99),
(5, 5, 5, 1, 89.99),
(6, 6, 6, 1, 29.99),
(7, 7, 7, 1, 14.99),
(8, 8, 8, 1, 24.99),
(9, 9, 4, 1, 49.99),
(10, 10, 9, 1, 29.99);

INSERT INTO ShoppingCart (cartId, userId) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

INSERT INTO CartItem (cartItemId, cartId, productId, quantity, price) VALUES
(1, 1, 1, 1, 699.99),
(2, 2, 2, 1, 999.99),
(3, 3, 3, 1, 19.99),
(4, 4, 4, 1, 49.99),
(5, 5, 5, 1, 89.99),
(6, 6, 6, 1, 29.99),
(7, 7, 7, 1, 14.99),
(8, 8, 8, 1, 24.99),
(9, 9, 9, 1, 29.99),
(10, 10, 10, 1, 29.99);

INSERT INTO Payment (paymentId, orderId, paymentDate, paymentMethod, amount, paymentStatus) VALUES
(1, 1, '2024-08-02', 'Credit Card', 719.98, 'Completed'),
(2, 2, '2024-08-03', 'PayPal', 1049.98, 'Completed'),
(3, 3, '2024-08-04', 'Credit Card', 19.99, 'Refunded'),
(4, 4, '2024-08-05', 'Bank Transfer', 99.98, 'Pending'),
(5, 5, '2024-08-06', 'Credit Card', 89.99, 'Completed'),
(6, 6, '2024-08-07', 'PayPal', 29.99, 'Completed'),
(7, 7, '2024-08-08', 'Credit Card', 14.99, 'Completed'),
(8, 8, '2024-08-09', 'Bank Transfer', 24.99, 'Completed'),
(9, 9, '2024-08-10', 'Credit Card', 49.99, 'Refunded'),
(10, 10, '2024-08-11', 'PayPal', 29.99, 'Pending');

INSERT INTO Shipment (shipmentId, orderId, shipmentDate, carrier, trackingNumber, status) VALUES
(1, 1, '2024-08-02', 'FedEx', '123456789', 'Delivered'),
(2, 2, '2024-08-03', 'UPS', '987654321', 'In Transit'),
(3, 4, '2024-08-05', 'DHL', '1122334455', 'Pending'),
(4, 5, '2024-08-06', 'FedEx', '6677889900', 'Delivered'),
(5, 6, '2024-08-07', 'USPS', '2233445566', 'In Transit'),
(6, 7, '2024-08-08', 'DHL', '3344556677', 'Delivered'),
(7, 8, '2024-08-09', 'UPS', '4455667788', 'In Transit'),
(8, 10, '2024-08-10', 'FedEx', '5566778899', 'Pending'),
(9, 9, '2024-08-11', 'USPS', '6677889900', 'Cancelled'),
(10, 3, '2024-08-12', 'DHL', '7788990011', 'Delivered');

INSERT INTO Supplier (supplierId, name, contactName, phone, email, addressId) VALUES
(1, 'TechSupply', 'John Doe', '123-456-7890', 'john@techsupply.com', 1),
(2, 'BookHub', 'Jane Smith', '234-567-8901', 'jane@bookhub.com', 2),
(3, 'FashionWorld', 'Emily Johnson', '345-678-9012', 'emily@fashionworld.com', 3),
(4, 'HomeEssentials', 'Michael Brown', '456-789-0123', 'michael@homeessentials.com', 4),
(5, 'SportyGoods', 'Sarah Davis', '567-890-1234', 'sarah@sportygoods.com', 5),
(6, 'ToyLand', 'David Wilson', '678-901-2345', 'david@toyland.com', 6),
(7, 'BeautyBliss', 'Laura Moore', '789-012-3456', 'laura@beautybliss.com', 7),
(8, 'AutoParts', 'Kevin Clark', '890-123-4567', 'kevin@autoparts.com', 8),
(9, 'GardenPlus', 'Sophia Lewis', '901-234-5678', 'sophia@gardenplus.com', 9),
(10, 'HealthFirst', 'James Lee', '012-345-6789', 'james@healthfirst.com', 10);

INSERT INTO ProductSupplier (productSupplierId, productId, supplierId, price, quantity) VALUES
(1, 1, 1, 650.00, 100),
(2, 2, 1, 950.00, 50),
(3, 3, 2, 18.00, 200),
(4, 4, 3, 45.00, 150),
(5, 5, 4, 85.00, 80),
(6, 6, 5, 27.00, 120),
(7, 7, 6, 12.00, 300),
(8, 8, 7, 22.00, 90),
(9, 9, 8, 25.00, 70),
(10, 10, 9, 27.00, 60);

INSERT INTO ProductReview (reviewId, productId, userId, rating, comment, reviewDate, helpfulCount) VALUES
(1, 1, 1, 5, 'Great product, highly recommend!', '2024-08-02', 10),
(2, 2, 2, 4, 'Good performance but a bit pricey.', '2024-08-03', 8),
(3, 3, 3, 3, 'The story was okay, not the best.', '2024-08-04', 5),
(4, 4, 4, 5, 'Fits perfectly, very comfortable.', '2024-08-05', 12),
(5, 5, 5, 4, 'Blends well, very powerful.', '2024-08-06', 7),
(6, 6, 6, 5, 'Perfect for the game, great quality.', '2024-08-07', 9),
(7, 7, 7, 5, 'My kid loves this doll, very cute!', '2024-08-08', 11),
(8, 8, 8, 3, 'Color was a bit off, but still okay.', '2024-08-09', 6),
(9, 9, 9, 4, 'Charges quickly, works well.', '2024-08-10', 8),
(10, 10, 10, 5, 'Hose is durable and flexible.', '2024-08-11', 10);

INSERT INTO PaymentGateway (gatewayId, name, description, transactionFee, status) VALUES
(1, 'PayPal', 'Online payment system', 2.9, 'Active'),
(2, 'Stripe', 'Credit card processing', 2.7, 'Active'),
(3, 'Square', 'Mobile payment processing', 2.6, 'Active'),
(4, 'Authorize.Net', 'Payment gateway service', 2.9, 'Inactive'),
(5, 'Braintree', 'Full-stack payment platform', 2.9, 'Active'),
(6, 'Amazon Pay', 'Payment processing by Amazon', 2.9, 'Active'),
(7, 'Apple Pay', 'Mobile payment service', 2.5, 'Active'),
(8, 'Google Pay', 'Digital wallet and payment system', 2.5, 'Active'),
(9, 'Payoneer', 'Online money transfer', 2.0, 'Inactive'),
(10, '2Checkout', 'Global payments system', 2.9, 'Active');


INSERT INTO BundleDiscount (bundleDiscountId, bundleId, discountId) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);

INSERT INTO StoreLocator (storeId, storeName, address, city, state, zipCode, country, phoneNumber, openingHours) VALUES
(1, 'TechStore', '123 Tech St', 'Albuquerque', 'NM', '87101', 'USA', '123-456-7890', '9 AM - 9 PM'),
(2, 'BookStore', '456 Book Ave', 'Santa Fe', 'NM', '87501', 'USA', '234-567-8901', '9 AM - 8 PM'),
(3, 'FashionStore', '789 Fashion Blvd', 'Las Cruces', 'NM', '88001', 'USA', '345-678-9012', '10 AM - 9 PM'),
(4, 'HomeStore', '101 Home St', 'Roswell', 'NM', '88201', 'USA', '456-789-0123', '9 AM - 8 PM'),
(5, 'SportsStore', '202 Sports Ln', 'Taos', 'NM', '87571', 'USA', '567-890-1234', '9 AM - 7 PM'),
(6, 'ToyStore', '303 Toy St', 'Farmington', 'NM', '87401', 'USA', '678-901-2345', '10 AM - 8 PM'),
(7, 'BeautyStore', '404 Beauty Ave', 'Gallup', 'NM', '87301', 'USA', '789-012-3456', '9 AM - 8 PM'),
(8, 'AutoStore', '505 Auto Blvd', 'Clovis', 'NM', '88101', 'USA', '890-123-4567', '9 AM - 7 PM'),
(9, 'GardenStore', '606 Garden St', 'Hobbs', 'NM', '88240', 'USA', '901-234-5678', '10 AM - 8 PM'),
(10, 'HealthStore', '707 Health St', 'Carlsbad', 'NM', '88220', 'USA', '012-345-6789', '9 AM - 6 PM');

INSERT INTO CustomerFeedback (feedbackId, userId, feedbackText, feedbackDate, responseText, responseDate, status) VALUES
(1, 1, 'Great service, fast delivery!', '2024-08-02', 'Thank you for your feedback!', '2024-08-03', 'Responded'),
(2, 2, 'Product arrived damaged.', '2024-08-03', 'We apologize, we will replace it.', '2024-08-04', 'Responded'),
(3, 3, 'Good quality, but slow shipping.', '2024-08-04', 'Sorry for the delay, we will improve.', '2024-08-05', 'Responded'),
(4, 4, 'Easy to navigate website.', '2024-08-05', 'Thank you for your feedback!', '2024-08-06', 'Responded'),
(5, 5, 'The product was out of stock.', '2024-08-06', 'We will notify you once it\'s back.', '2024-08-07', 'Responded'),
(6, 6, 'Excellent customer support.', '2024-08-07', 'We appreciate your kind words.', '2024-08-08', 'Responded'),
(7, 7, 'The color was not as expected.', '2024-08-08', 'We will work on better images.', '2024-08-09', 'Responded'),
(8, 8, 'Very satisfied with the purchase.', '2024-08-09', 'Thank you for your feedback!', '2024-08-10', 'Responded'),
(9, 9, 'Packaging could be improved.', '2024-08-10', 'We will work on it.', '2024-08-11', 'Responded'),
(10, 10, 'Product didn\'t match description.', '2024-08-11', 'Sorry, we will ensure accuracy.', '2024-08-12', 'Closed');

INSERT INTO SalesTax (taxId, region, taxRate, applicableTo) VALUES
(1, 'New Mexico', 5.00, 'All Products'),
(2, 'Texas', 6.25, 'All Products'),
(3, 'California', 7.25, 'All Products'),
(4, 'Arizona', 5.60, 'All Products'),
(5, 'Colorado', 2.90, 'All Products'),
(6, 'Nevada', 6.85, 'All Products'),
(7, 'Oregon', 0.00, 'All Products'),
(8, 'Washington', 6.50, 'All Products'),
(9, 'Utah', 4.85, 'All Products'),
(10, 'Idaho', 6.00, 'All Products');

INSERT INTO CampaignMetrics (metricId, campaignId, impressions, clicks, conversions, revenueGenerated) VALUES
(1, 101, 5000, 250, 50, 1500.00),
(2, 102, 6000, 300, 60, 1800.00),
(3, 103, 7000, 350, 70, 2100.00),
(4, 104, 8000, 400, 80, 2400.00),
(5, 105, 9000, 450, 90, 2700.00),
(6, 106, 10000, 500, 100, 3000.00),
(7, 107, 11000, 550, 110, 3300.00),
(8, 108, 12000, 600, 120, 3600.00),
(9, 109, 13000, 650, 130, 3900.00),
(10, 110, 14000, 700, 140, 4200.00);

INSERT INTO UserActivityLog (activityLogId, userId, activity, activityDate) VALUES
(1, 1, 'Viewed Product', '2024-09-01'),
(2, 2, 'Added to Cart', '2024-09-01'),
(3, 3, 'Purchased Product', '2024-09-02'),
(4, 4, 'Reviewed Product', '2024-09-02'),
(5, 5, 'Shared Product', '2024-09-03'),
(6, 6, 'Added to Wishlist', '2024-09-03'),
(7, 7, 'Visited Homepage', '2024-09-04'),
(8, 8, 'Applied Discount Code', '2024-09-04'),
(9, 9, 'Contacted Support', '2024-09-05'),
(10, 10, 'Updated Profile', '2024-09-05');


INSERT INTO InventoryRestock (productId, restockDate, quantity, cost) VALUES
(1, '2024-09-01', 100, 500.00),
(2, '2024-09-01', 150, 750.00),
(3, '2024-09-02', 200, 1000.00),
(4, '2024-09-02', 250, 1250.00),
(5, '2024-09-03', 300, 1500.00),
(6, '2024-09-03', 350, 1750.00),
(7, '2024-09-04', 400, 2000.00),
(8, '2024-09-04', 450, 2250.00),
(9, '2024-09-05', 500, 2500.00),
(10, '2024-09-05', 550, 2750.00);

INSERT INTO ProductBundle (bundleName, bundleDescription, bundlePrice) VALUES
('Sanitary Set A', 'Includes toilet, sink, and faucet', 300.00),
('Sanitary Set B', 'Includes shower, toilet, and sink', 350.00),
('Sanitary Set C', 'Includes bath, toilet, and accessories', 400.00),
('Sanitary Set D', 'Includes sink, faucet, and mirror', 250.00),
('Sanitary Set E', 'Includes toilet, bidet, and sink', 450.00),
('Sanitary Set F', 'Includes shower and faucet set', 200.00),
('Sanitary Set G', 'Includes bath and shower', 500.00),
('Sanitary Set H', 'Includes faucet and sink set', 180.00),
('Sanitary Set I', 'Includes toilet and bidet set', 400.00),
(10, 'Sanitary Set J', 'Includes all essential sanitary products', 600.00);


INSERT INTO BundleItem (bundleId, productId, quantity) VALUES
(1, 1, 1),
(1, 2, 1),
(1, 3, 1),
(2, 4, 1),
(2, 5, 1),
(2, 6, 1),
(3, 7, 1),
(3, 8, 1),
(3, 9, 1),
(4, 10, 1),
(4, 11, 1),
(5, 12, 1),
(5, 13, 1),
(6, 14, 1),
(6, 15, 1),
(7, 16, 1),
(7, 17, 1),
(8, 18, 1),
(8, 19, 1),
(9, 20, 1),
(9, 21, 1),
(10, 22, 1),
(10, 23, 1);



INSERT INTO Discount (discountCode, discountType, discountValue, validFrom, validTo) VALUES
('SANITARY10', 'Percentage', 10.00, '2024-09-01', '2024-09-30'),
('SANITARY20', 'Percentage', 20.00, '2024-09-01', '2024-09-30'),
('FIXED50', 'Fixed Amount', 50.00, '2024-09-01', '2024-09-30'),
('FIXED100', 'Fixed Amount', 100.00, '2024-09-01', '2024-09-30'),
('SUMMER15', 'Percentage', 15.00, '2024-09-01', '2024-09-30'),
('WINTER25', 'Percentage', 25.00, '2024-10-01', '2024-12-31'),
('CLEANING50', 'Fixed Amount', 50.00, '2024-09-01', '2024-09-30'),
('BATH10', 'Percentage', 10.00, '2024-09-01', '2024-09-30'),
('TOILET20', 'Percentage', 20.00, '2024-09-01', '2024-09-30'),
('TILES30', 'Percentage', 30.00, '2024-09-01', '2024-09-30');


------------ Insert Records into the MarketingCampaign Table ------------
INSERT INTO MarketingCampaign (campaignName, startDate, endDate, budget, campaignType) VALUES
('Sanitary Summer Sale', '2024-09-01', '2024-09-30', 5000.00, 'Social Media'),
('Winter Bathroom Refresh', '2024-10-01', '2024-12-31', 7000.00, 'Email'),
('Spring Cleaning Specials', '2024-03-01', '2024-05-31', 3000.00, 'Social Media'),
('New Product Launch', '2024-06-01', '2024-08-31', 4000.00, 'Email'),
('Holiday Sale', '2024-11-01', '2024-12-31', 6000.00, 'Social Media'),
('Year-End Clearance', '2024-12-01', '2024-12-31', 2000.00, 'Email'),
('Spring Deal', '2024-03-01', '2024-05-31', 3500.00, 'Social Media'),
('Summer Discount', '2024-06-01', '2024-08-31', 4500.00, 'Social Media'),
('Fall Specials', '2024-09-01', '2024-11-30', 5000.00, 'Email'),
('Winter Offers', '2024-12-01', '2024-12-31', 4000.00, 'Social Media');


INSERT INTO CampaignDiscount (campaignId, discountId) VALUES
(1, 1),
(1, 2),
(2, 6),
(2, 7),
(3, 3),
(3, 4),
(4, 5),
(4, 8),
(5, 9),
(6, 10);

INSERT INTO ProductTag (tagName) VALUES
('Toilets'),
('Sinks'),
('Bathtubs'),
('Shower Heads'),
('Faucets'),
('Tiles'),
('Vanities'),
('Mirrors'),
('Bidets'),
('Shower Doors');

INSERT INTO ProductTagAssignment (productId, tagId) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 1),
(12, 2),
(13, 3),
(14, 4),
(15, 5),
(16, 6),
(17, 7),
(18, 8),
(19, 9),
(20, 10);

INSERT INTO ShippingMethod (methodName, cost, estimatedDeliveryTime) VALUES
('Standard Shipping', 5.00, '5-7 business days'),
('Expedited Shipping', 15.00, '2-3 business days'),
('Next-Day Shipping', 25.00, '1 business day'),
('Free Shipping', 0.00, '7-10 business days'),
('Same-Day Delivery', 30.00, 'Same day'),
('Overnight Shipping', 20.00, '1 business day'),
('Two-Day Shipping', 12.00, '2 business days'),
('International Shipping', 50.00, '10-15 business days'),
('Express Shipping', 18.00, '1-2 business days'),
('Economy Shipping', 8.00, '5-7 business days');

INSERT INTO ShipmentTracking (shipmentId, updateDate, status, location) VALUES
(1, '2024-09-02', 'Shipped', 'Warehouse A'),
(2, '2024-09-02', 'In Transit', 'Distribution Center B'),
(3, '2024-09-03', 'Delivered', 'Customer Address 1'),
(4, '2024-09-03', 'Shipped', 'Warehouse B'),
(5, '2024-09-04', 'In Transit', 'Distribution Center C'),
(6, '2024-09-04', 'Delivered', 'Customer Address 2'),
(7, '2024-09-05', 'Out for Delivery', 'Delivery Hub A'),
(8, '2024-09-05', 'Delivered', 'Customer Address 3'),
(9, '2024-09-06', 'Shipped', 'Warehouse C'),
(10, '2024-09-06', 'In Transit', 'Distribution Center A');

INSERT INTO ReturnRequest (orderId, productId, returnDate, returnReason, status) VALUES
(1, 1, '2024-09-05', 'Defective item', 'Pending'),
(2, 2, '2024-09-06', 'Wrong item received', 'Approved'),
(3, 3, '2024-09-07', 'Not as described', 'Rejected'),
(4, 4, '2024-09-08', 'Change of mind', 'Pending'),
(5, 5, '2024-09-09', 'Damaged during shipping', 'Approved'),
(6, 6, '2024-09-10', 'Product malfunction', 'Pending'),
(7, 7, '2024-09-11', 'Defective item', 'Rejected'),
(8, 8, '2024-09-12', 'Wrong item received', 'Pending'),
(9, 9, '2024-09-13', 'Not as described', 'Approved'),
(10, 10, '2024-09-14', 'Change of mind', 'Rejected');

INSERT INTO LoyaltyProgram (programName, description, pointsRequired, reward) VALUES
('Basic Rewards', 'Earn points for every purchase and redeem for discounts.', 100, '10% off'),
('Premium Rewards', 'Exclusive benefits and higher points accumulation.', 500, 'Free shipping'),
('Elite Rewards', 'Top-tier program with extra perks and high reward value.', 1000, 'Free product'),
('Holiday Special', 'Special rewards for holiday season purchases.', 200, '20% off'),
('Summer Bonanza', 'Earn bonus points during summer sales.', 300, 'Free gift'),
('New Member Bonus', 'Special introductory rewards for new members.', 150, '15% off'),
('VIP Program', 'Premium benefits for our most loyal customers.', 800, 'Extra reward points'),
('Referral Rewards', 'Earn points by referring friends.', 250, 'Referral discount'),
('Bundle Discounts', 'Additional points for purchasing bundles.', 400, 'Bundle discount'),
('Anniversary Special', 'Exclusive rewards for anniversary month.', 600, 'Exclusive offer');

INSERT INTO LoyaltyPoints (userId, points, dateUpdated) VALUES
(1, 100, '2024-09-01'),
(2, 150, '2024-09-02'),
(3, 200, '2024-09-03'),
(4, 250, '2024-09-04'),
(5, 300, '2024-09-05'),
(6, 350, '2024-09-06'),
(7, 400, '2024-09-07'),
(8, 450, '2024-09-08'),
(9, 500, '2024-09-09'),
(10, 550, '2024-09-10');

INSERT INTO CustomProductRequest (userId, productName, description, requestedDate, status) VALUES
(1, 'Custom Sink', 'A sink with unique dimensions and design.', '2024-09-01', 'Pending'),
(2, 'Bespoke Bathtub', 'Bathtub with custom features.', '2024-09-02', 'In Progress'),
(3, 'Special Shower Head', 'Shower head with multiple spray settings.', '2024-09-03', 'Completed'),
(4, 'Unique Toilet Design', 'Toilet with custom color and style.', '2024-09-04', 'Pending'),
(5, 'Custom Mirror', 'Mirror with integrated lighting.', '2024-09-05', 'Completed'),
(6, 'Designer Faucet', 'Faucet with unique finish.', '2024-09-06', 'In Progress'),
(7, 'Luxury Vanity', 'Vanity with additional storage features.', '2024-09-07', 'Pending'),
(8, 'Custom Tile Pattern', 'Tiles with custom patterns and colors.', '2024-09-08', 'Completed'),
(9, 'Special Bidet', 'Bidet with added functionality.', '2024-09-09', 'In Progress'),
(10, 'Custom Shower Door', 'Shower door with bespoke glass design.', '2024-09-10', 'Completed');

INSERT INTO SupplierContactLog (supplierId, contactDate, contactMethod, notes) VALUES
(1, '2024-09-01', 'Email', 'Requested a quote for new batch of sinks.'),
(2, '2024-09-02', 'Phone', 'Discussed delivery schedules for bathtubs.'),
(3, '2024-09-03', 'Email', 'Inquired about availability of custom shower heads.'),
(4, '2024-09-04', 'Phone', 'Followed up on order for custom toilets.'),
(5, '2024-09-05', 'Email', 'Requested product samples for mirrors.'),
(6, '2024-09-06', 'Phone', 'Discussed new faucet designs with supplier.'),
(7, '2024-09-07', 'Email', 'Confirmed shipment details for vanities.'),
(8, '2024-09-08', 'Phone', 'Inquired about tile customization options.'),
(9, '2024-09-09', 'Email', 'Requested details on bidet functionalities.'),
(10, '2024-09-10', 'Phone', 'Discussed custom shower door designs and pricing.');

INSERT INTO ProductSpecification (productId, specName, specValue) VALUES
(1, 'Material', 'Ceramic'),
(2, 'Dimensions', '60x30x20 cm'),
(3, 'Finish', 'Glossy'),
(4, 'Color', 'White'),
(5, 'Water Efficiency', 'High'),
(6, 'Warranty', '5 years'),
(7, 'Installation Type', 'Wall-mounted'),
(8, 'Shape', 'Oval'),
(9, 'Features', 'Anti-slip'),
(10, 'Brand', 'SanitaryPlus');

INSERT INTO FAQ (question, answer, productId) VALUES
('What is the warranty on this product?', 'This product comes with a 5-year warranty.', 1),
('Is installation included?', 'Installation is not included. Please contact a local professional.', 2),
('Can the faucet be customized?', 'Yes, we offer customization options for our faucets.', 3),
('What is the return policy?', 'Returns are accepted within 30 days of purchase.', 4),
('Are these products eco-friendly?', 'Yes, our products are designed to be eco-friendly.', 5),
('How do I clean the surface?', 'Use a mild detergent and soft cloth to clean the surface.', 6),
('Do you offer bulk discounts?', 'Yes, we offer discounts for bulk purchases. Please contact us for more details.', 7),
('What colors are available?', 'We offer a range of colors including white, beige, and gray.', 8),
('Can I order a custom size?', 'Yes, custom sizes can be ordered upon request.', 9),
('What is the expected delivery time?', 'Delivery typically takes 5-7 business days.', 10);

INSERT INTO ProductAlert (userId, productId, alertType, alertDate) VALUES
(1, 1, 'Restock', '2024-09-01'),
(2, 2, 'Price Drop', '2024-09-02'),
(3, 3, 'Restock', '2024-09-03'),
(4, 4, 'Price Drop', '2024-09-04'),
(5, 5, 'Restock', '2024-09-05'),
(6, 6, 'Price Drop', '2024-09-06'),
(7, 7, 'Restock', '2024-09-07'),
(8, 8, 'Price Drop', '2024-09-08'),
(9, 9, 'Restock', '2024-09-09'),
(10, 10, 'Price Drop', '2024-09-10');

INSERT INTO ProductComparison (userId, comparisonDate) VALUES
(1, '2024-09-01'),
(2, '2024-09-02'),
(3, '2024-09-03'),
(4, '2024-09-04'),
(5, '2024-09-05'),
(6, '2024-09-06'),
(7, '2024-09-07'),
(8, '2024-09-08'),
(9, '2024-09-09'),
(10, '2024-09-10');

INSERT INTO ComparisonItem (comparisonId, productId) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(4, 8),
(5, 9),
(5, 10),
(6, 1),
(6, 3),
(7, 2),
(7, 4),
(8, 5),
(8, 7),
(9, 8),
(9, 9),
(10, 10),
(10, 1);

INSERT INTO StorePromotion (storeId, promotionName, promotionDescription, startDate, endDate, discount) VALUES
(1, 'Summer Sale', 'Discount on all sanitary ware items for summer.', '2024-06-01', '2024-08-31', 15.00),
(2, 'New Arrival Discount', 'Special discount on newly arrived products.', '2024-07-01', '2024-09-30', 10.00),
(3, 'Holiday Offer', 'Exclusive holiday discounts on selected items.', '2024-12-01', '2024-12-31', 20.00),
(4, 'Buy One Get One Free', 'Buy one product and get another one free.', '2024-10-01', '2024-11-15', 0.00),
(5, 'End of Year Clearance', 'Clearance sale at the end of the year.', '2024-11-16', '2024-12-31', 25.00),
(6, 'Black Friday Sale', 'Special discounts on Black Friday.', '2024-11-29', '2024-11-30', 30.00),
(7, 'Customer Appreciation', 'Discount for loyal customers.', '2024-09-01', '2024-09-30', 12.00),
(8, 'Spring Special', 'Spring sale with discounts on selected products.', '2024-03-01', '2024-05-31', 18.00),
(9, 'Clearance Sale', 'Clearance discounts on old stock.', '2024-08-01', '2024-08-31', 22.00),
(10, 'Weekend Flash Sale', 'Flash sale on weekends with special discounts.', '2024-09-07', '2024-09-08', 10.00);

INSERT INTO AffiliatePartner (partnerName, contactEmail, contactPhone, commissionRate) VALUES
('Sanitary Pro Affiliates', 'contact@sanitarypro.com', '555-0101', 5.00),
('Bath & Beyond Partners', 'info@bathbeyond.com', '555-0102', 6.50),
('Home Comfort Affiliates', 'support@homecomfort.com', '555-0103', 4.75),
('Luxury Baths Network', 'sales@luxurybaths.com', '555-0104', 7.00),
('Green Home Affiliates', 'hello@greenhome.com', '555-0105', 5.50),
('Modern Living Partners', 'contact@modernliving.com', '555-0106', 6.00),
('Elegant Interiors', 'info@elegantinteriors.com', '555-0107', 5.25),
('Classic Home Affiliates', 'support@classichome.com', '555-0108', 4.50),
('Premium Bath Network', 'sales@premiumbath.com', '555-0109', 6.75),
(10, 'Quality Bath Partners', 'contact@qualitybath.com', '555-0110', 5.00);

INSERT INTO AffiliateSale (affiliateId, orderId, commission, saleDate) VALUES
(1, 101, 50.00, '2024-09-01'),
(2, 102, 65.00, '2024-09-02'),
(3, 103, 47.50, '2024-09-03'),
(4, 104, 70.00, '2024-09-04'),
(5, 105, 55.00, '2024-09-05'),
(6, 106, 60.00, '2024-09-06'),
(7, 107, 52.50, '2024-09-07'),
(8, 108, 75.00, '2024-09-08'),
(9, 109, 67.50, '2024-09-09'),
(10, 110, 55.00, '2024-09-10');

INSERT INTO Event (eventName, eventDate, eventLocation, eventDescription) VALUES
('Sanitary Ware Expo', '2024-10-10', 'Convention Center', 'A showcase of the latest in sanitary ware.'),
('Holiday Sale Event', '2024-12-15', 'Main Store', 'Special holiday sale event with discounts and promotions.'),
('Spring Collection Launch', '2024-03-20', 'Showroom', 'Launch of new spring collection with exclusive previews.'),
('Black Friday Deals', '2024-11-29', 'Online', 'Huge discounts on sanitary ware for Black Friday.'),
('Customer Appreciation Day', '2024-09-12', 'Headquarters', 'Thank you event for loyal customers with special offers.'),
('Product Knowledge Seminar', '2024-11-10', 'Conference Hall', 'Seminar on product features and benefits for staff and partners.'),
('Annual Trade Show', '2024-08-25', 'Expo Center', 'Annual trade show featuring top brands and products.'),
('Year-End Clearance', '2024-12-05', 'Warehouse', 'Clearance event to make space for new inventory.'),
('New Product Showcase', '2024-07-15', 'Retail Store', 'Showcase of newly introduced sanitary ware products.'),
('Specialty Bath Fair', '2024-05-18', 'Fairgrounds', 'Exhibition of specialty bath products and innovations.');

INSERT INTO EventRegistration (eventId, userId, registrationDate) VALUES
(1, 1, '2024-09-01'),
(2, 2, '2024-12-01'),
(3, 3, '2024-03-01'),
(4, 4, '2024-11-01'),
(5, 5, '2024-09-05'),
(6, 6, '2024-11-05'),
(7, 7, '2024-08-20'),
(8, 8, '2024-12-01'),
(9, 9, '2024-07-10'),
(10, 10, '2024-05-10');

INSERT INTO ProductWarranty (productId, warrantyPeriod, warrantyDescription) VALUES
(1, 24, '2 years warranty covering manufacturing defects.'),
(2, 12, '1 year warranty on parts and labor.'),
(3, 36, '3 years extended warranty with comprehensive coverage.'),
(4, 18, '1.5 years warranty with limited coverage.'),
(5, 24, '2 years warranty on workmanship and materials.'),
(6, 12, '1 year warranty for replacement parts.'),
(7, 24, '2 years warranty including extended support.'),
(8, 36, '3 years warranty with optional extension.'),
(9, 18, '1.5 years warranty with full coverage on defects.'),
(10, 12, '1 year warranty with free service call.');

INSERT INTO WarrantyClaim (warrantyId, userId, claimDate, claimDescription, status) VALUES
(1, 1, '2024-09-02', 'Leakage issue with the sink.', 'Pending'),
(2, 2, '2024-09-03', 'Cracked bathtub after installation.', 'Approved'),
(3, 3, '2024-09-04', 'Defective shower head.', 'Pending'),
(4, 4, '2024-09-05', 'Toilet not flushing properly.', 'Rejected'),
(5, 5, '2024-09-06', 'Vanity has a scratch.', 'Approved'),
(6, 6, '2024-09-07', 'Malfunctioning faucet.', 'Pending'),
(7, 7, '2024-09-08', 'Faulty mirror with LED lights.', 'Rejected'),
(8, 8, '2024-09-09', 'Tile chips after installation.', 'Approved'),
(9, 9, '2024-09-10', 'Bidet not functioning correctly.', 'Pending'),
(10, 10, '2024-09-11', 'Shower door has alignment issues.', 'Rejected');

INSERT INTO ProductMaintenance (productId, maintenanceDate, maintenanceDetails) VALUES
(1, '2024-09-01', 'Routine check and cleaning.'),
(2, '2024-09-02', 'Repaired leaking faucet.'),
(3, '2024-09-03', 'Replaced faulty valve.'),
(4, '2024-09-04', 'Adjusted toilet flush mechanism.'),
(5, '2024-09-05', 'Cleaned and polished vanity surface.'),
(6, '2024-09-06', 'Repaired dripping shower head.'),
(7, '2024-09-07', 'Fixed LED lights in the mirror.'),
(8, '2024-09-08', 'Re-grouted chipped tiles.'),
(9, '2024-09-09', 'Recalibrated bidet settings.'),
(10, '2024-09-10', 'Realigned shower door.'); 

INSERT INTO UserPreference (userId, preferenceKey, preferenceValue) VALUES
(1, 'preferred_brands', 'BrandA, BrandB'),
(2, 'favorite_color', 'Blue'),
(3, 'email_notifications', 'true'),
(4, 'preferred_material', 'Ceramic'),
(5, 'order_history', 'enabled'),
(6, 'discount_alerts', 'true'),
(7, 'customization_options', 'High'),
(8, 'warranty_preferences', 'Extended'),
(9, 'installation_service', 'requested'),
(10, 'maintenance_reminders', 'enabled');

INSERT INTO ProductInstallation (productId, installationDate, installerName, installationDetails) VALUES
(1, '2024-09-01', 'John Doe', 'Installed sink in the kitchen.'),
(2, '2024-09-02', 'Jane Smith', 'Installed new bathtub in the bathroom.'),
(3, '2024-09-03', 'Alice Brown', 'Installed shower head in the master bath.'),
(4, '2024-09-04', 'Bob White', 'Installed toilet in the guest bathroom.'),
(5, '2024-09-05', 'Michael Green', 'Installed vanity in the powder room.'),
(6, '2024-09-06', 'Emily Johnson', 'Installed faucet in the kitchen sink.'),
(7, '2024-09-07', 'Daniel Black', 'Installed mirror with LED lights.'),
(8, '2024-09-08', 'Sarah Lee', 'Installed tiles in the shower area.'),
(9, '2024-09-09', 'Chris Davis', 'Installed bidet in the master bath.'),
(10, '2024-09-10', 'Linda Wilson', 'Installed shower door in the guest bath.');

INSERT INTO ProductCustomization (productId, customizationType, customizationOptions) VALUES
(1, 'Color', 'Available in white, black, and gray.'),
(2, 'Size', 'Available in standard and deluxe sizes.'),
(3, 'Material', 'Options include ceramic and porcelain.'),
(4, 'Finish', 'Glossy and matte finishes available.'),
(5, 'Shape', 'Round and rectangular options.'),
(6, 'Style', 'Modern and classic styles.'),
(7, 'Handle Type', 'Lever or knob handles.'),
(8, 'Mounting', 'Wall-mounted and floor-mounted options.'),
(9, 'Installation', 'Custom installation for unique spaces.'),
(10, 'Accessory', 'Includes matching accessories like towel bars.');

INSERT INTO ServiceTicket (userId, issueDate, issueDescription, status, resolution) VALUES
(1, '2024-09-01', 'Leaking faucet in the kitchen sink.', 'In Progress', NULL),
(2, '2024-09-02', 'Cracked bathtub after installation.', 'Resolved', 'Replaced the bathtub with a new one.'),
(3, '2024-09-03', 'Defective shower head.', 'Open', NULL),
(4, '2024-09-04', 'Toilet not flushing properly.', 'In Progress', NULL),
(5, '2024-09-05', 'Vanity has a scratch on the surface.', 'Resolved', 'Polished the vanity to remove the scratch.'),
(6, '2024-09-06', 'Malfunctioning faucet in the bathroom.', 'Open', NULL),
(7, '2024-09-07', 'Faulty LED lights in the mirror.', 'Resolved', 'Replaced the LED lights in the mirror.'),
(8, '2024-09-08', 'Chipped tiles in the shower area.', 'In Progress', NULL),
(9, '2024-09-09', 'Bidet not functioning correctly.', 'Open', NULL),
(10, '2024-09-10', 'Shower door alignment issues.', 'Resolved', 'Realigned the shower door to ensure proper fit.');

INSERT INTO ProductAffiliation (productId, brandName) VALUES
(1, 'BrandA'),
(2, 'BrandB'),
(3, 'BrandC'),
(4, 'BrandA'),
(5, 'BrandD'),
(6, 'BrandE'),
(7, 'BrandF'),
(8, 'BrandG'),
(9, 'BrandH'),
(10, 'BrandI');

INSERT INTO SupplierRating (supplierId, rating, review, ratingDate) VALUES
(1, 4, 'Good quality products, but delivery was delayed.', '2024-09-01'),
(2, 5, 'Excellent service and high-quality sanitary ware.', '2024-09-02'),
(3, 3, 'Average quality, needs improvement.', '2024-09-03'),
(4, 4, 'Decent quality, but pricing could be better.', '2024-09-04'),
(5, 5, 'Top-notch quality and timely delivery.', '2024-09-05'),
(6, 2, 'Poor customer service and product quality.', '2024-09-06'),
(7, 4, 'Good quality, though sometimes inconsistent.', '2024-09-07'),
(8, 3, 'Fair quality, average service.', '2024-09-08'),
(9, 5, 'Exceptional products and very reliable.', '2024-09-09'),
(10, 4, 'Good overall experience with minor issues.', '2024-09-10');

INSERT INTO PriceHistory (productId, price, changeDate) VALUES
(1, 199.99, '2024-09-01'),
(2, 299.99, '2024-09-02'),
(3, 149.99, '2024-09-03'),
(4, 229.99, '2024-09-04'),
(5, 399.99, '2024-09-05'),
(6, 159.99, '2024-09-06'),
(7, 249.99, '2024-09-07'),
(8, 179.99, '2024-09-08'),
(9, 299.99, '2024-09-09'),
(10, 399.99, '2024-09-10');

INSERT INTO ProductMaterial (productId, materialName) VALUES
(1, 'Ceramic'),
(2, 'Porcelain'),
(3, 'Stainless Steel'),
(4, 'Glass'),
(5, 'Marble'),
(6, 'Aluminum'),
(7, 'Acrylic'),
(8, 'Bronze'),
(9, 'Copper'),
(10, 'Plastic');

INSERT INTO UserRole (roleName, permissions) VALUES
('Admin', 'read,write,delete'),
('Sales', 'read,write'),
('Customer Service', 'read,write'),
('Warehouse', 'read,write'),
('Marketing', 'read'),
('Finance', 'read,write,delete'),
('Supplier', 'read'),
('Installer', 'read'),
('Product Manager', 'read,write'),
('IT Support', 'read,write');

INSERT INTO UserRoleAssignment (userId, roleId, assignmentDate) VALUES
(1, 1, '2024-09-01'),
(2, 2, '2024-09-02'),
(3, 3, '2024-09-03'),
(4, 4, '2024-09-04'),
(5, 5, '2024-09-05'),
(6, 6, '2024-09-06'),
(7, 7, '2024-09-07'),
(8, 8, '2024-09-08'),
(9, 9, '2024-09-09'),
(10, 10, '2024-09-10');

INSERT INTO ProductUsage (productId, usageDate, quantityUsed) VALUES
(1, '2024-09-01', 5),
(2, '2024-09-02', 3),
(3, '2024-09-03', 10),
(4, '2024-09-04', 2),
(5, '2024-09-05', 7),
(6, '2024-09-06', 4),
(7, '2024-09-07', 6),
(8, '2024-09-08', 8),
(9, '2024-09-09', 1),
(10, '2024-09-10', 9);

INSERT INTO ReturnReason (reasonDescription) VALUES
('Defective product'),
('Wrong item shipped'),
('Product does not match description'),
('Missing parts'),
('Quality not as expected'),
('Damaged during shipping'),
('Product arrived late'),
('Order canceled'),
('Changed mind'),
('Other');

INSERT INTO ReturnRequestReason (returnRequestId, reasonId) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

INSERT INTO WarrantyExtension (warrantyId, extensionPeriod, cost) VALUES
(1, 12, 49.99),
(2, 6, 29.99),
(3, 24, 79.99),
(4, 12, 39.99),
(5, 18, 59.99),
(6, 6, 19.99),
(7, 24, 89.99),
(8, 12, 44.99),
(9, 18, 64.99),
(10, 24, 94.99);

INSERT INTO LoyaltyProgramLevel (levelName, minPointsRequired, benefits) VALUES
('Bronze', 0, 'Basic rewards and discounts.'),
('Silver', 1000, 'Free shipping and early access to sales.'),
('Gold', 5000, 'Exclusive discounts and priority customer service.'),
('Platinum', 10000, 'Special gifts and personalized offers.'),
('Diamond', 20000, 'VIP treatment and additional perks.'),
('Ruby', 30000, 'Luxury rewards and premium support.'),
('Emerald', 40000, 'Custom benefits and high-end rewards.'),
('Sapphire', 50000, 'Top-tier exclusive benefits.'),
('Onyx', 60000, 'Ultimate rewards and personalized service.'),
('Elite', 70000, 'Unlimited benefits and exclusive experiences.');

INSERT INTO UserLoyaltyLevel (userId, levelId, effectiveDate) VALUES
(1, 1, '2024-09-01'),
(2, 2, '2024-09-02'),
(3, 3, '2024-09-03'),
(4, 4, '2024-09-04'),
(5, 5, '2024-09-05'),
(6, 6, '2024-09-06'),
(7, 7, '2024-09-07'),
(8, 8, '2024-09-08'),
(9, 9, '2024-09-09'),
(10, 10, '2024-09-10');

INSERT INTO SupplierContract (supplierId, contractDate, expirationDate, contractDetails) VALUES
(1, '2024-09-01', '2025-09-01', 'Annual supply contract for ceramic tiles.'),
(2, '2024-09-02', '2025-09-02', 'Quarterly supply of faucets and fixtures.'),
(3, '2024-09-03', '2025-09-03', 'Monthly supply of bathroom vanities.'),
(4, '2024-09-04', '2025-09-04', 'Semi-annual supply of showerheads.'),
(5, '2024-09-05', '2025-09-05', 'Yearly contract for porcelain tiles.'),
(6, '2024-09-06', '2025-09-06', 'Monthly delivery of sinks.'),
(7, '2024-09-07', '2025-09-07', 'Quarterly contract for bathroom accessories.'),
(8, '2024-09-08', '2025-09-08', 'Annual supply of bath tubs.'),
(9, '2024-09-09', '2025-09-09', 'Yearly contract for high-end fixtures.'),
(10, '2024-09-10', '2025-09-10', 'Semi-annual supply of installation kits.');

INSERT INTO ProductCategory (categoryName, parentCategoryId) VALUES
('Fixtures', NULL),
('Tiles', NULL),
('Vanities', NULL),
('Faucets', NULL),
('Showers', NULL),
('Toilets', NULL),
('Sinks', NULL),
('Bathtubs', NULL),
('Accessories', NULL),
('Custom Products', NULL);

INSERT INTO ProductVariant (productId, variantName, variantValue) VALUES
(1, 'Color', 'White, Black, Gray'),
(2, 'Size', 'Standard, Deluxe'),
(3, 'Material', 'Ceramic, Porcelain'),
(4, 'Finish', 'Glossy, Matte'),
(5, 'Shape', 'Round, Rectangular'),
(6, 'Style', 'Modern, Classic'),
(7, 'Handle Type', 'Lever, Knob'),
(8, 'Mounting', 'Wall-mounted, Floor-mounted'),
(9, 'Installation', 'Custom, Standard'),
(10, 'Accessory', 'Includes matching towel bars');

INSERT INTO LoyaltyReward (rewardName, rewardDescription, pointsRequired) VALUES
('Discount Coupon', '10% off on your next purchase', 500),
('Free Shipping', 'Enjoy free shipping on your next order', 1000),
('Gift Voucher', 'Gift voucher worth $50', 2000),
('Exclusive Product', 'Access to limited edition products', 3000),
('Early Access', 'Early access to new arrivals', 4000),
('Free Installation', 'Free installation service on your next purchase', 5000),
('Extended Warranty', 'Additional 1 year warranty on selected products', 6000),
('Personalized Gift', 'Custom gift based on your preferences', 7000),
('VIP Support', 'Priority customer support services', 8000),
('Special Event Invitation', 'Invitation to exclusive events', 9000);

INSERT INTO RewardRedemption (userId, rewardId, redemptionDate) VALUES
(1, 1, '2024-09-01'),
(2, 2, '2024-09-02'),
(3, 3, '2024-09-03'),
(4, 4, '2024-09-04'),
(5, 5, '2024-09-05'),
(6, 6, '2024-09-06'),
(7, 7, '2024-09-07'),
(8, 8, '2024-09-08'),
(9, 9, '2024-09-09'),
(10, 10, '2024-09-10');

INSERT INTO SupplierPerformance (supplierId, metricName, metricValue, recordDate) VALUES
(1, 'On-time Delivery', 95.0, '2024-09-01'),
(2, 'Product Quality', 4.5, '2024-09-02'),
(3, 'Customer Satisfaction', 4.0, '2024-09-03'),
(4, 'Response Time', 2.5, '2024-09-04'),
(5, 'Return Rate', 1.0, '2024-09-05'),
(6, 'Order Accuracy', 98.0, '2024-09-06'),
(7, 'Cost Competitiveness', 3.5, '2024-09-07'),
(8, 'Innovation', 4.2, '2024-09-08'),
(9, 'Product Range', 4.0, '2024-09-09'),
(10, 'Service Quality', 4.8, '2024-09-10');

INSERT INTO InventoryLocation (locationName, locationAddress) VALUES 
('Warehouse A', '123 Main St, Cityville'),
('Warehouse B', '456 Elm St, Cityville'),
('Warehouse C', '789 Oak St, Townsville'),
('Warehouse D', '101 Pine St, Villageville'),
('Warehouse E', '202 Maple St, Metropolis'),
('Warehouse F', '303 Birch St, Hamlet'),
('Warehouse G', '404 Cedar St, Rivertown'),
('Warehouse H', '505 Spruce St, Capital City'),
('Warehouse I', '606 Willow St, Lakeside'),
('Warehouse J', '707 Fir St, Greenfield');

INSERT INTO StockAtLocation (productId, locationId, stockQuantity) VALUES 
(1, 1, 100),
(2, 1, 150),
(3, 2, 200),
(4, 2, 250),
(5, 3, 300),
(6, 3, 350),
(7, 4, 400),
(8, 4, 450),
(9, 5, 500),
(10, 5, 550);

INSERT INTO ProductCampaign (productId, campaignName, startDate, endDate, discount) VALUES 
(1, 'Spring Sale', '2024-03-01', '2024-03-31', 10.00),
(2, 'Summer Sale', '2024-06-01', '2024-06-30', 15.00),
(3, 'Autumn Sale', '2024-09-01', '2024-09-30', 20.00),
(4, 'Winter Sale', '2024-12-01', '2024-12-31', 25.00),
(5, 'Holiday Sale', '2024-11-01', '2024-12-24', 30.00),
(6, 'Clearance Sale', '2024-07-01', '2024-07-31', 35.00),
(7, 'Back to School', '2024-08-01', '2024-08-31', 10.00),
(8, 'New Year Sale', '2024-01-01', '2024-01-31', 40.00),
(9, 'Black Friday', '2024-11-29', '2024-11-30', 50.00),
(10, 'Cyber Monday', '2024-12-02', '2024-12-02', 45.00);

INSERT INTO CustomerSegment (segmentName, segmentCriteria) VALUES 
('Premium Customers', 'Annual spend > $1000'),
('Frequent Buyers', 'Purchase frequency > 5 times'),
('New Customers', 'Registered within the last 6 months'),
('Discount Seekers', 'Purchases with discount applied > 3 times'),
('High Income', 'Income > $100,000'),
('Eco-Friendly', 'Purchase eco-friendly products'),
('Luxury Buyers', 'Purchase luxury items'),
('Budget Shoppers', 'Price sensitivity index > 7'),
('First-Time Buyers', 'First purchase made'),
('Loyal Customers', 'Repeat purchases > 10');

INSERT INTO CustomerSegmentAssignment (userId, segmentId, assignmentDate) VALUES 
(1, 1, '2024-01-10'),
(2, 2, '2024-02-15'),
(3, 3, '2024-03-20'),
(4, 4, '2024-04-25'),
(5, 5, '2024-05-30'),
(6, 6, '2024-06-05'),
(7, 7, '2024-07-10'),
(8, 8, '2024-08-15'),
(9, 9, '2024-09-20'),
(10, 10, '2024-10-25');

INSERT INTO ProductKit (kitName, kitDescription, kitPrice) VALUES 
('Basic Sanitary Kit', 'Includes sink, toilet, and faucet.', 150.00),
('Luxury Sanitary Kit', 'Includes premium sink, toilet, and faucet.', 300.00),
('Eco-Friendly Kit', 'Includes water-saving sink, toilet, and faucet.', 200.00),
('Commercial Kit', 'Heavy-duty sink, toilet, and faucet for commercial use.', 400.00),
('Compact Kit', 'Space-saving sink, toilet, and faucet.', 100.00),
('Family Kit', 'Includes sink, toilet, and faucet with additional features for families.', 250.00),
('Modern Kit', 'Sleek design sink, toilet, and faucet.', 175.00),
('Traditional Kit', 'Classic design sink, toilet, and faucet.', 180.00),
('Luxury Plus Kit', 'High-end sink, toilet, and faucet with extra features.', 350.00),
('Budget Kit', 'Affordable sink, toilet, and faucet.', 80.00);

INSERT INTO KitComponent (kitId, productId, quantity) VALUES 
(1, 1, 1),
(1, 2, 1),
(1, 3, 1),
(2, 4, 1),
(2, 5, 1),
(2, 6, 1),
(3, 7, 1),
(3, 8, 1),
(3, 9, 1),
(4, 10, 1),
(4, 11, 1),
(4, 12, 1),
(5, 13, 1),
(5, 14, 1),
(5, 15, 1),
(6, 16, 1),
(6, 17, 1),
(6, 18, 1),
(7, 19, 1),
(7, 20, 1),
(7, 21, 1);

INSERT INTO PurchaseOrder (supplierId, orderDate, status, totalAmount) VALUES 
(1, '2024-01-15', 'Pending', 5000.00),
(2, '2024-02-20', 'Completed', 3000.00),
(3, '2024-03-25', 'Cancelled', 4000.00),
(4, '2024-04-30', 'Completed', 6000.00),
(5, '2024-05-05', 'Pending', 3500.00),
(6, '2024-06-10', 'Completed', 4500.00),
(7, '2024-07-15', 'Pending', 7000.00),
(8, '2024-08-20', 'Completed', 5500.00),
(9, '2024-09-25', 'Cancelled', 6500.00),
(10, '2024-10-30', 'Completed', 8000.00);

INSERT INTO PurchaseOrderItem (purchaseOrderId, productId, quantity, price) VALUES 
(1, 1, 10, 50.00),
(1, 2, 5, 100.00),
(2, 3, 20, 30.00),
(2, 4, 10, 150.00),
(3, 5, 15, 40.00),
(3, 6, 8, 80.00),
(4, 7, 12, 60.00),
(4, 8, 15, 90.00),
(5, 9, 18, 35.00),
(5, 10, 10, 120.00);

INSERT INTO CustomerPurchaseHistory (userId, orderId, purchaseDate, totalAmount) VALUES 
(1, 1, '2024-01-16', 500.00),
(2, 2, '2024-02-21', 300.00),
(3, 3, '2024-03-26', 400.00),
(4, 4, '2024-04-31', 600.00),
(5, 5, '2024-05-06', 350.00),
(6, 6, '2024-06-11', 450.00),
(7, 7, '2024-07-16', 700.00),
(8, 8, '2024-08-21', 550.00),
(9, 9, '2024-09-26', 650.00),
(10, 10, '2024-10-31', 800.00);

INSERT INTO ProductExpiry (productId, expiryDate) VALUES 
(1, '2025-01-15'),
(2, '2025-02-20'),
(3, '2025-03-25'),
(4, '2025-04-30'),
(5, '2025-05-05'),
(6, '2025-06-10'),
(7, '2025-07-15'),
(8, '2025-08-20'),
(9, '2025-09-25'),
(10, '2025-10-30');

INSERT INTO ProductAssembly (productId, assemblyInstructions) VALUES 
(1, 'Assemble the sink with the provided fittings. Attach the faucet and connect the water supply.'),
(2, 'Install the toilet by following the step-by-step guide. Ensure proper sealing and connections.'),
(3, 'Attach the faucet to the sink. Connect the drain and water lines as per the manual.'),
(4, 'Fit the toilet to the floor and connect it to the water supply. Verify all connections are secure.'),
(5, 'Install the sink and connect the faucet. Check for leaks and adjust fittings as necessary.'),
(6, 'Assemble the entire kit, starting with the sink. Follow the included diagram for precise assembly.'),
(7, 'Install the components in the order shown in the guide. Ensure all fittings are tight and secure.'),
(8, 'Follow the instructions to assemble and install the sink and toilet. Check for any installation issues.'),
(9, 'Carefully follow the assembly guide for each component. Ensure proper alignment and fit.'),
(10, 'Assemble the kit components according to the provided instructions. Test for functionality.');

INSERT INTO ProductCertification (productId, certificationName, certificationDate, certificationDetails) VALUES 
(1, 'ISO 9001', '2024-01-20', 'Quality management certification.'),
(2, 'CE Marking', '2024-02-15', 'Conformity with European standards.'),
(3, 'NSF Certification', '2024-03-10', 'Safe for contact with drinking water.'),
(4, 'UL Listing', '2024-04-05', 'Certified for electrical safety.'),
(5, 'WaterSense', '2024-05-01', 'Water efficiency certification.'),
(6, 'Green Seal', '2024-06-15', 'Environmental certification for eco-friendly products.'),
(7, 'CSA Certified', '2024-07-10', 'Certified by the Canadian Standards Association.'),
(8, 'ADA Compliant', '2024-08-20', 'Accessibility certification for disabled persons.'),
(9, 'BPI Certified', '2024-09-25', 'Building Performance Institute certification.'),
(10, 'ASTM Standard', '2024-10-30', 'Compliance with ASTM standards.');

INSERT INTO WarrantyClaimsHistory (warrantyId, claimDate, claimStatus, resolutionDetails) VALUES 
(1, '2024-01-25', 'Pending', 'Awaiting parts replacement.'),
(2, '2024-02-28', 'Approved', 'Replacement issued.'),
(3, '2024-03-15', 'Rejected', 'Out of warranty period.'),
(4, '2024-04-20', 'Approved', 'Repair completed successfully.'),
(5, '2024-05-25', 'Pending', 'Under review by technician.'),
(6, '2024-06-30', 'Approved', 'Refund processed.'),
(7, '2024-07-15', 'Rejected', 'Damage not covered under warranty.'),
(8, '2024-08-25', 'Pending', 'Parts ordered, awaiting delivery.'),
(9, '2024-09-10', 'Approved', 'Replacement part shipped.'),
(10, '2024-10-20', 'Rejected', 'Claim filed after warranty expiration.');

INSERT INTO CustomerPurchasePreference (userId, preferenceType, preferenceValue) VALUES 
(1, 'Brand', 'American Standard'),
(2, 'Style', 'Modern'),
(3, 'Color', 'White'),
(4, 'Material', 'Ceramic'),
(5, 'Feature', 'Water-saving'),
(6, 'Brand', 'Kohler'),
(7, 'Style', 'Classic'),
(8, 'Color', 'Beige'),
(9, 'Material', 'Porcelain'),
(10, 'Feature', 'Eco-friendly');

INSERT INTO CustomerInteractionLog (userId, interactionDate, interactionType, interactionDetails) VALUES 
(1, '2024-01-10', 'Call', 'Discussed product features and pricing.'),
(2, '2024-01-12', 'Chat', 'Inquired about installation service details.'),
(3, '2024-01-15', 'Email', 'Requested a product catalog.'),
(4, '2024-01-18', 'Call', 'Follow-up on recent purchase.'),
(5, '2024-01-20', 'Chat', 'Reported an issue with a recent order.'),
(6, '2024-01-22', 'Call', 'Inquired about warranty coverage.'),
(7, '2024-01-25', 'Email', 'Feedback on recent product experience.'),
(8, '2024-01-27', 'Chat', 'Asked about return process.'),
(9, '2024-01-30', 'Call', 'Requested an update on order status.'),
(10, '2024-02-01', 'Email', 'Enquired about upcoming sales.');

INSERT INTO ProductAvailability (productId, storeId, onlineAvailability, inStoreAvailability) VALUES 
(1, 1, TRUE, TRUE),
(2, 1, TRUE, FALSE),
(3, 2, TRUE, TRUE),
(4, 2, FALSE, TRUE),
(5, 3, TRUE, TRUE),
(6, 3, TRUE, FALSE),
(7, 4, FALSE, TRUE),
(8, 4, TRUE, TRUE),
(9, 5, TRUE, FALSE),
(10, 5, FALSE, TRUE);

INSERT INTO InstallationService (serviceName, serviceDescription, serviceCost) VALUES 
('Basic Installation', 'Standard installation for sinks and faucets.', 100.00),
('Premium Installation', 'Includes installation of high-end fixtures and fittings.', 200.00),
('Eco-Friendly Installation', 'Installation using environmentally friendly practices.', 150.00),
('Commercial Installation', 'Heavy-duty installation for commercial settings.', 300.00),
('Quick Installation', 'Fast installation service with minimal disruption.', 80.00),
('Complete Installation', 'Full installation including plumbing and fittings.', 250.00),
('Safety Installation', 'Installation with a focus on safety and compliance.', 120.00),
('Luxury Installation', 'Premium service for luxury and high-end products.', 350.00),
('Standard Maintenance', 'Routine maintenance for installed products.', 90.00),
('Emergency Installation', 'Urgent installation service for critical situations.', 250.00);

INSERT INTO InstallationServiceRequest (userId, productId, serviceId, requestDate, requestStatus) VALUES 
(1, 1, 1, '2024-01-12', 'Requested'),
(2, 2, 2, '2024-01-15', 'In Progress'),
(3, 3, 3, '2024-01-18', 'Completed'),
(4, 4, 4, '2024-01-20', 'Requested'),
(5, 5, 5, '2024-01-22', 'In Progress'),
(6, 6, 6, '2024-01-25', 'Completed'),
(7, 7, 7, '2024-01-27', 'Requested'),
(8, 8, 8, '2024-01-30', 'Completed'),
(9, 9, 9, '2024-02-01', 'In Progress'),
(10, 10, 10, '2024-02-03', 'Requested');

INSERT INTO SupplierProductAssociation (supplierId, productId, associationDate) VALUES 
(1, 1, '2024-01-10'),
(2, 2, '2024-01-15'),
(3, 3, '2024-01-20'),
(4, 4, '2024-01-25'),
(5, 5, '2024-01-30'),
(6, 6, '2024-02-01'),
(7, 7, '2024-02-05'),
(8, 8, '2024-02-10'),
(9, 9, '2024-02-15'),
(10, 10, '2024-02-20');

INSERT INTO ProductReturn (orderId, productId, returnDate, returnReason, returnStatus) VALUES 
(1, 1, '2024-01-12', 'Product defective', 'Requested'),
(2, 2, '2024-01-15', 'Wrong item received', 'Approved'),
(3, 3, '2024-01-18', 'Not as described', 'Rejected'),
(4, 4, '2024-01-20', 'Changed mind', 'Approved'),
(5, 5, '2024-01-22', 'Product damaged', 'Requested'),
(6, 6, '2024-01-25', 'Quality issue', 'Approved'),
(7, 7, '2024-01-27', 'Received wrong color', 'Rejected'),
(8, 8, '2024-01-30', 'Defective part', 'Requested'),
(9, 9, '2024-02-01', 'Late delivery', 'Approved'),
(10, 10, '2024-02-03', 'Product not needed', 'Rejected');

INSERT INTO ServiceFeedback (userId, serviceId, feedbackDate, feedbackText, rating) VALUES 
(1, 1, '2024-01-13', 'Service was prompt and professional.', 5),
(2, 2, '2024-01-16', 'The installation took longer than expected.', 3),
(3, 3, '2024-01-19', 'Great service, very satisfied.', 4),
(4, 4, '2024-01-22', 'Installation was incomplete, need follow-up.', 2),
(5, 5, '2024-01-25', 'Service was good but the cost was high.', 4),
(6, 6, '2024-01-28', 'Excellent work, highly recommend.', 5),
(7, 7, '2024-01-31', 'Not satisfied with the quality of work.', 2),
(8, 8, '2024-02-03', 'The team was very professional and efficient.', 5),
(9, 9, '2024-02-06', 'The installation was delayed, but the quality was fine.', 3),
(10, 10, '2024-02-09', 'Good service, would use again.', 4);

INSERT INTO MarketingCampaignType (typeName, typeDescription) VALUES 
('Email Marketing', 'Campaigns sent via email to potential customers.'),
('Social Media Advertising', 'Advertisements displayed on social media platforms.'),
('Search Engine Marketing', 'Paid search engine advertisements.'),
('Content Marketing', 'Creating and sharing valuable content to attract customers.'),
('Influencer Marketing', 'Collaborations with influencers to promote products.'),
('Print Advertising', 'Advertisements in newspapers and magazines.'),
('Event Marketing', 'Promoting products through events and trade shows.'),
('Direct Mail', 'Physical mail sent to potential customers.'),
('Television Advertising', 'Ads broadcasted on television.'),
('Radio Advertising', 'Ads broadcasted on radio stations.');

INSERT INTO MarketingCampaignDetail (campaignId, campaignTypeId, startDate, endDate, budget) VALUES 
(1, 1, '2024-01-05', '2024-01-31', 2000.00),
(2, 2, '2024-02-01', '2024-02-28', 3000.00),
(3, 3, '2024-03-01', '2024-03-31', 2500.00),
(4, 4, '2024-04-01', '2024-04-30', 1500.00),
(5, 5, '2024-05-01', '2024-05-31', 4000.00),
(6, 6, '2024-06-01', '2024-06-30', 1800.00),
(7, 7, '2024-07-01', '2024-07-31', 2200.00),
(8, 8, '2024-08-01', '2024-08-31', 1600.00),
(9, 9, '2024-09-01', '2024-09-30', 2700.00),
(10, 10, '2024-10-01', '2024-10-31', 2900.00);

INSERT INTO ProductRecall (productId, recallDate, recallReason, recallInstructions) VALUES 
(1, '2024-01-10', 'Defective valve', 'Return to supplier for replacement.'),
(2, '2024-01-15', 'Manufacturing defect', 'Stop use immediately and contact support.'),
(3, '2024-01-20', 'Safety issue', 'Follow recall instructions sent via email.'),
(4, '2024-01-25', 'Non-compliance with standards', 'Return product for a full refund.'),
(5, '2024-01-30', 'Faulty component', 'Discontinue use and return product.'),
(6, '2024-02-01', 'Quality issue', 'Contact customer service for return instructions.'),
(7, '2024-02-05', 'Incorrect labeling', 'Product is safe but incorrect labeling needs to be corrected.'),
(8, '2024-02-10', 'Design flaw', 'Return product and receive a replacement.'),
(9, '2024-02-15', 'Component failure', 'Follow the instructions to return the faulty component.'),
(10, '2024-02-20', 'Performance issue', 'Return product for inspection and refund.');

INSERT INTO ProductMaintenance (productId, maintenanceDate, maintenanceType, maintenanceDetails) VALUES 
(1, '2024-01-15', 'Cleaning', 'Routine cleaning of sink.'),
(2, '2024-02-10', 'Repair', 'Replaced faulty valve in the toilet.'),
(3, '2024-03-05', 'Inspection', 'Checked for leaks and functionality.'),
(4, '2024-04-15', 'Cleaning', 'Thorough cleaning of faucet.'),
(5, '2024-05-10', 'Repair', 'Fixed minor issues with the toilet.'),
(6, '2024-06-20', 'Inspection', 'Routine inspection of installed products.'),
(7, '2024-07-25', 'Cleaning', 'Cleaned and disinfected the sink.'),
(8, '2024-08-15', 'Repair', 'Repaired minor scratches on the faucet.'),
(9, '2024-09-10', 'Inspection', 'Inspection for upcoming warranty expiration.'),
(10, '2024-10-05', 'Cleaning', 'Deep cleaning of all installed products.');

INSERT INTO CustomerSubscription (userId, planName, planDescription, startDate, endDate, subscriptionStatus) VALUES 
(1, 'Basic Plan', 'Access to basic features and support.', '2024-01-01', '2024-12-31', 'Active'),
(2, 'Premium Plan', 'Includes premium features and priority support.', '2024-01-01', '2024-12-31', 'Active'),
(3, 'Standard Plan', 'Standard features with regular support.', '2024-01-01', '2024-06-30', 'Expired'),
(4, 'Family Plan', 'Discounted rates for family accounts.', '2024-01-01', '2024-12-31', 'Active'),
(5, 'Business Plan', 'Features tailored for business needs.', '2024-01-01', '2024-06-30', 'Expired'),
(6, 'Enterprise Plan', 'Comprehensive features and dedicated support.', '2024-01-01', '2024-12-31', 'Active'),
(7, 'Student Plan', 'Discounted plan for students.', '2024-01-01', '2024-06-30', 'Expired'),
(8, 'Senior Plan', 'Special plan for seniors with additional benefits.', '2024-01-01', '2024-12-31', 'Active'),
(9, 'Trial Plan', 'Free trial with limited features.', '2024-01-01', '2024-03-31', 'Expired'),
(10, 'Custom Plan', 'Tailored plan based on individual needs.', '2024-01-01', '2024-12-31', 'Active');

INSERT INTO SubscriptionPlanBenefit (subscriptionId, benefitDescription) VALUES 
(1, 'Access to basic features and customer support.'),
(2, 'Priority customer support and access to exclusive features.'),
(3, 'Standard customer support and access to essential features.'),
(4, 'Discounted rates for family members and extended support.'),
(5, 'Enhanced support for business needs and additional features.'),
(6, 'Dedicated support team and all premium features included.'),
(7, 'Discounted plan with additional support for students.'),
(8, 'Special benefits and discounts for senior citizens.'),
(9, 'Limited access to features with no cost during the trial period.'),
(10, 'Custom features and support based on specific user needs.');

INSERT INTO QualityAssurance (productId, qaDate, qaResult, qaComments) VALUES 
(1, '2024-01-15', 'Passed', 'Product met all quality standards.'),
(2, '2024-02-10', 'Failed', 'Product did not meet durability standards.'),
(3, '2024-03-05', 'Passed', 'Product passed all performance tests.'),
(4, '2024-04-15', 'Passed', 'Product met all safety and quality requirements.'),
(5, '2024-05-10', 'Failed', 'Issues detected in material quality.'),
(6, '2024-06-20', 'Passed', 'Product passed the inspection with no issues.'),
(7, '2024-07-25', 'Passed', 'Product met all specified standards.'),
(8, '2024-08-15', 'Failed', 'Minor defects found in the product.'),
(9, '2024-09-10', 'Passed', 'Product quality verified and certified.'),
(10, '2024-10-05', 'Passed', 'No issues found, product is in excellent condition.');

INSERT INTO SupportTicket (userId, ticketDate, ticketStatus, ticketSubject, ticketDescription) VALUES 
(1, '2024-01-12', 'Open', 'Installation Issue', 'Problem with installation of sink.'),
(2, '2024-01-15', 'In Progress', 'Product Defect', 'Received a defective faucet.'),
(3, '2024-01-18', 'Closed', 'Order Delay', 'Order delivery was delayed by a week.'),
(4, '2024-01-22', 'Open', 'Warranty Query', 'Query regarding warranty coverage.'),
(5, '2024-01-25', 'In Progress', 'Product Return', 'Request for product return due to damage.'),
(6, '2024-01-28', 'Closed', 'Refund Request', 'Request for a refund due to product issues.'),
(7, '2024-01-31', 'Open', 'Quality Issue', 'Quality issue with the purchased toilet.'),
(8, '2024-02-03', 'In Progress', 'Service Feedback', 'Feedback on recent installation service.'),
(9, '2024-02-06', 'Closed', 'Order Status', 'Inquiry about the status of the recent order.'),
(10, '2024-02-09', 'Open', 'Product Replacement', 'Request for a replacement of the faulty product.');

INSERT INTO TicketResponse (ticketId, responseDate, responseText) VALUES
(1, '2024-09-01', 'Response for ticket 1'),
(2, '2024-09-02', 'Response for ticket 2'),
(3, '2024-09-03', 'Response for ticket 3'),
(4, '2024-09-04', 'Response for ticket 4'),
(5, '2024-09-05', 'Response for ticket 5'),
(6, '2024-09-06', 'Response for ticket 6'),
(7, '2024-09-07', 'Response for ticket 7'),
(8, '2024-09-08', 'Response for ticket 8'),
(9, '2024-09-09', 'Response for ticket 9'),
(10, '2024-09-10', 'Response for ticket 10');

INSERT INTO ProductPromotion (promotionName, promotionDescription, startDate, endDate, discount) VALUES
('Summer Sale', 'Discount on all summer collection', '2024-06-01', '2024-06-30', 20.00),
('Winter Sale', 'Discount on all winter collection', '2024-12-01', '2024-12-31', 25.00),
('New Year Sale', 'Special discounts for New Year', '2024-12-25', '2024-12-31', 15.00),
('Black Friday', 'Huge discounts on Black Friday', '2024-11-29', '2024-11-29', 30.00),
('Cyber Monday', 'Exclusive online discounts', '2024-12-02', '2024-12-02', 20.00),
('Spring Offer', 'Discount on new spring collection', '2024-03-01', '2024-03-31', 10.00),
('Summer Clearance', 'Clearance sale for summer stock', '2024-07-01', '2024-07-31', 40.00),
('Fall Sale', 'Discount on fall collection', '2024-09-01', '2024-09-30', 18.00),
('Holiday Sale', 'Festive discounts on selected items', '2024-11-01', '2024-11-15', 22.00),
('End of Season', 'Final clearance sale', '2024-08-01', '2024-08-31', 35.00);

INSERT INTO PromotionProduct (promotionId, productId) VALUES
(1, 101),
(1, 102),
(2, 103),
(2, 104),
(3, 105),
(3, 106),
(4, 107),
(4, 108),
(5, 109),
(5, 110);

INSERT INTO ManufacturingBatch (productId, batchNumber, productionDate, expiryDate) VALUES
(101, 'BATCH001', '2024-01-10', '2025-01-10'),
(102, 'BATCH002', '2024-02-15', '2025-02-15'),
(103, 'BATCH003', '2024-03-20', '2025-03-20'),
(104, 'BATCH004', '2024-04-25', '2025-04-25'),
(105, 'BATCH005', '2024-05-30', '2025-05-30'),
(106, 'BATCH006', '2024-06-05', '2025-06-05'),
(107, 'BATCH007', '2024-07-10', '2025-07-10'),
(108, 'BATCH008', '2024-08-15', '2025-08-15'),
(109, 'BATCH009', '2024-09-20', '2025-09-20'),
(110, 'BATCH010', '2024-10-25', '2025-10-25');

INSERT INTO ProductRepair (productId, repairDate, repairDetails, repairCost) VALUES
(101, '2024-08-01', 'Fixed leak issue', 50.00),
(102, '2024-08-05', 'Replaced broken handle', 30.00),
(103, '2024-08-10', 'Repaired water flow', 40.00),
(104, '2024-08-15', 'Fixed crack in basin', 70.00),
(105, '2024-08-20', 'Replaced damaged parts', 60.00),
(106, '2024-08-25', 'Addressed color fading', 20.00),
(107, '2024-09-01', 'Fixed alignment issue', 45.00),
(108, '2024-09-05', 'Repaired drainage system', 55.00),
(109, '2024-09-10', 'Replaced leaking faucet', 35.00),
(110, '2024-09-15', 'Repaired surface scratches', 25.00);

INSERT INTO SupplierContact (supplierId, contactName, contactPhone, contactEmail, contactRole) VALUES
(1, 'John Smith', '555-0101', 'john.smith@example.com', 'Sales Manager'),
(2, 'Jane Doe', '555-0102', 'jane.doe@example.com', 'Product Specialist'),
(3, 'Alice Johnson', '555-0103', 'alice.johnson@example.com', 'Customer Service'),
(4, 'Bob Brown', '555-0104', 'bob.brown@example.com', 'Technical Support'),
(5, 'Carol White', '555-0105', 'carol.white@example.com', 'Account Manager'),
(6, 'David Lee', '555-0106', 'david.lee@example.com', 'Quality Control'),
(7, 'Emily Davis', '555-0107', 'emily.davis@example.com', 'Logistics Coordinator'),
(8, 'Frank Miller', '555-0108', 'frank.miller@example.com', 'Supplier Relations'),
(9, 'Grace Wilson', '555-0109', 'grace.wilson@example.com', 'Product Development'),
(10, 'Henry Adams', '555-0110', 'henry.adams@example.com', 'Procurement Officer');

INSERT INTO InventoryReplenishmentRequest (productId, requestedQuantity, requestDate, requestStatus) VALUES
(101, 50, '2024-09-01', 'Pending'),
(102, 30, '2024-09-02', 'Approved'),
(103, 40, '2024-09-03', 'Rejected'),
(104, 20, '2024-09-04', 'Pending'),
(105, 60, '2024-09-05', 'Approved'),
(106, 35, '2024-09-06', 'Pending'),
(107, 45, '2024-09-07', 'Approved'),
(108, 25, '2024-09-08', 'Rejected'),
(109, 55, '2024-09-09', 'Pending'),
(110, 65, '2024-09-10', 'Approved');

INSERT INTO StoreProductAvailability (storeId, productId, availableQuantity) VALUES
(1, 101, 100),
(1, 102, 150),
(2, 103, 200),
(2, 104, 120),
(3, 105, 90),
(3, 106, 110),
(4, 107, 80),
(4, 108, 130),
(5, 109, 140),
(5, 110, 160);

INSERT INTO InstallationGuide (productId, guideTitle, guideContent) VALUES
(101, 'Installation Guide for Model A', 'Step 1: ...\nStep 2: ...'),
(102, 'Installation Guide for Model B', 'Step 1: ...\nStep 2: ...'),
(103, 'Installation Guide for Model C', 'Step 1: ...\nStep 2: ...'),
(104, 'Installation Guide for Model D', 'Step 1: ...\nStep 2: ...'),
(105, 'Installation Guide for Model E', 'Step 1: ...\nStep 2: ...'),
(106, 'Installation Guide for Model F', 'Step 1: ...\nStep 2: ...'),
(107, 'Installation Guide for Model G', 'Step 1: ...\nStep 2: ...'),
(108, 'Installation Guide for Model H', 'Step 1: ...\nStep 2: ...'),
(109, 'Installation Guide for Model I', 'Step 1: ...\nStep 2: ...'),
(110, 'Installation Guide for Model J', 'Step 1: ...\nStep 2: ...');

