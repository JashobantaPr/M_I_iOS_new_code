class ClaimData {
  final bool? status;
  final String? claimType;
  final String? approvalType;
  final List<HierarchyLevel>? hierarchyLevels;
  final List<HierarchyNode>? hierarchyNodes;
  final Map<String, String>? productHierarchyNodes;
  final Map<String, String>? skuHierarchyNodes;
  final List<BusinessHierarchyLevel>? businessHierarchyLevels;
  final List<ProductHierarchyLevel>? productHierarchyLevels;
  final String? highestProductHierarchyLevelRank;
  final List<SlabDetail>? slabDetails;
  final List<ProductHierarchyLevelData>? productHierarchyLevelData;
  final String? fixedFieldsJson;
  final String? customFieldsJson;

  ClaimData({
    this.status,
    this.claimType,
    this.approvalType,
    this.hierarchyLevels,
    this.hierarchyNodes,
    this.productHierarchyNodes,
    this.skuHierarchyNodes,
    this.businessHierarchyLevels,
    this.productHierarchyLevels,
    this.highestProductHierarchyLevelRank,
    this.slabDetails,
    this.productHierarchyLevelData,
    this.fixedFieldsJson,
    this.customFieldsJson,
  });

  factory ClaimData.fromJson(Map<String, dynamic> json) {
    return ClaimData(
      status: json['status'] as bool?,
      claimType: json['data']?['claim_type'] as String?,
      approvalType: json['data']?['approval_type'] as String?,
      hierarchyLevels: (json['data']?['hierarchy_levels'] as List<dynamic>?)
              ?.map((level) => HierarchyLevel.fromJson(level))
              .toList() ??
          [], // Null check and default to empty list
      hierarchyNodes: (json['data']?['hierachy_nodes'] as List<dynamic>?)
              ?.map((node) => HierarchyNode.fromJson(node))
              .toList() ??
          [], // Null check and default to empty list
      productHierarchyNodes: (json['data']?['product_hierarchy_nodes'] != null)
          ? Map<String, String>.from(
              json['data']!['product_hierarchy_nodes'] as Map)
          : {}, // Null check and default to empty map
      skuHierarchyNodes: (json['data']?['sku_hierarchy_nodes'] != null)
          ? Map<String, String>.from(
              json['data']!['sku_hierarchy_nodes'] as Map)
          : {}, // Null check and default to empty map
      businessHierarchyLevels:
          (json['data']?['get_business_hierarchy_levels'] as List<dynamic>?)
                  ?.map((level) => BusinessHierarchyLevel.fromJson(level))
                  .toList() ??
              [], // Null check and default to empty list
      productHierarchyLevels:
          (json['data']?['product_hierarchy_levels'] as List<dynamic>?)
                  ?.map((level) => ProductHierarchyLevel.fromJson(level))
                  .toList() ??
              [], // Null check and default to empty list
      highestProductHierarchyLevelRank:
          json['data']?['highest_product_hierarchy_level_rank'].toString(),
      slabDetails: (json['data']?['slab_details'] as List<dynamic>?)
              ?.map((detail) => SlabDetail.fromJson(detail))
              .toList() ??
          [], // Null check and default to empty list
      productHierarchyLevelData:
          (json['data']?['get_product_hierarchy_levels'] as List<dynamic>?)
                  ?.map((level) => ProductHierarchyLevelData.fromJson(level))
                  .toList() ??
              [], // Null check and default to empty list
      fixedFieldsJson: json['data']?['fixed_fields_json'] as String?,
      customFieldsJson: json['data']?['custom_fields_json'] as String?,
    );
  }
}

class HierarchyLevel {
  final String? hierarchyLevelId;
  final String? hierarchyLevelCode;
  final String? levelRank;
  final String? hierarchyName;
  final String? parentLevel;
  final String? cntNodes;

  HierarchyLevel({
    this.hierarchyLevelId,
    this.hierarchyLevelCode,
    this.levelRank,
    this.hierarchyName,
    this.parentLevel,
    this.cntNodes,
  });

  factory HierarchyLevel.fromJson(Map<String, dynamic> json) {
    return HierarchyLevel(
      hierarchyLevelId: json['hierarchy_level_id'],
      hierarchyLevelCode: json['hierarchy_level_code'],
      levelRank: json['level_rank'],
      hierarchyName: json['hierarchy_name'],
      parentLevel: json['parent_level'],
      cntNodes: json['cnt_nodes'],
    );
  }
}

class HierarchyNode {
  final String? hierarchyLevelId;
  final String? levelRank;
  final String? hierarchyNodeId;
  final String? nodeName;
  final String? parentNode;
  final String? nodePath;
  final String? parentNodePath;
  final String? companyIdFk;
  final String? lowerNode;
  final String? parentNodeStatus;
  final String? childNodeStatus;
  final String? parentNodeId;

  HierarchyNode({
    this.hierarchyLevelId,
    this.levelRank,
    this.hierarchyNodeId,
    this.nodeName,
    this.parentNode,
    this.nodePath,
    this.parentNodePath,
    this.companyIdFk,
    this.lowerNode,
    this.parentNodeStatus,
    this.childNodeStatus,
    this.parentNodeId,
  });

  factory HierarchyNode.fromJson(Map<String, dynamic> json) {
    return HierarchyNode(
      hierarchyLevelId: json['hierarchy_level_id'],
      levelRank: json['level_rank'],
      hierarchyNodeId: json['hierarchy_node_id'],
      nodeName: json['node_name'],
      parentNode: json['parent_node'],
      nodePath: json['node_path'],
      parentNodePath: json['parent_node_path'],
      companyIdFk: json['company_id_fk'],
      lowerNode: json['lower_node'],
      parentNodeStatus: json['parent_node_status'],
      childNodeStatus: json['child_node_status'],
      parentNodeId: json['parent_node_id'],
    );
  }
}

class BusinessHierarchyLevel {
  final String? businessHierarchyIdFk;
  final String? businessHierarchyLevelIdFk;
  final String? hierarchyNodeId;
  final String? nodePath;
  final String? levelRank;
  final String? parentNode;

  BusinessHierarchyLevel({
    this.businessHierarchyIdFk,
    this.businessHierarchyLevelIdFk,
    this.hierarchyNodeId,
    this.nodePath,
    this.levelRank,
    this.parentNode,
  });

  factory BusinessHierarchyLevel.fromJson(Map<String, dynamic> json) {
    return BusinessHierarchyLevel(
      businessHierarchyIdFk: json['business_hierarchy_id_fk'],
      businessHierarchyLevelIdFk: json['business_hierarchy_level_id_fk'],
      hierarchyNodeId: json['hierarchy_node_id'],
      nodePath: json['node_path'],
      levelRank: json['level_rank'],
      parentNode: json['parent_node'],
    );
  }
}

class ProductHierarchyLevel {
  final String? hierarchyLevelId;
  final String? hierarchyLevelCode;
  final String? levelRank;
  final String? hierarchyName;
  final String? parentLevel;
  final String? cntNodes;

  ProductHierarchyLevel({
    this.hierarchyLevelId,
    this.hierarchyLevelCode,
    this.levelRank,
    this.hierarchyName,
    this.parentLevel,
    this.cntNodes,
  });

  factory ProductHierarchyLevel.fromJson(Map<String, dynamic> json) {
    return ProductHierarchyLevel(
      hierarchyLevelId: json['hierarchy_level_id'],
      hierarchyLevelCode: json['hierarchy_level_code'],
      levelRank: json['level_rank'],
      hierarchyName: json['hierarchy_name'],
      parentLevel: json['parent_level'],
      cntNodes: json['cnt_nodes'],
    );
  }
}

class SlabDetail {
  final String? slabId;
  final String? slabStartValue;
  final String? slabEndValue;
  final String? slabTypeIdFk;
  final String? pointValue;
  final String? slabTypeName;

  SlabDetail({
    this.slabId,
    this.slabStartValue,
    this.slabEndValue,
    this.slabTypeIdFk,
    this.pointValue,
    this.slabTypeName,
  });

  factory SlabDetail.fromJson(Map<String, dynamic> json) {
    return SlabDetail(
      slabId: json['slab_id'],
      slabStartValue: json['slab_start_value'],
      slabEndValue: json['slab_end_value'],
      slabTypeIdFk: json['slab_type_id_fk'],
      pointValue: json['point_value'],
      slabTypeName: json['slab_type_name'],
    );
  }
}

class ProductHierarchyLevelData {
  final String? productHierarchyIdFk;
  final String? productHierarchyLevelIdFk;
  final String? hierarchyNodeId;
  final String? nodePath;
  final String? levelRank;
  final String? parentNode;

  ProductHierarchyLevelData({
    this.productHierarchyIdFk,
    this.productHierarchyLevelIdFk,
    this.hierarchyNodeId,
    this.nodePath,
    this.levelRank,
    this.parentNode,
  });

  factory ProductHierarchyLevelData.fromJson(Map<String, dynamic> json) {
    return ProductHierarchyLevelData(
      productHierarchyIdFk: json['product_hierarchy_id_fk'],
      productHierarchyLevelIdFk: json['product_hierarchy_level_id_fk'],
      hierarchyNodeId: json['hierarchy_node_id'],
      nodePath: json['node_path'],
      levelRank: json['level_rank'],
      parentNode: json['parent_node'],
    );
  }
}
